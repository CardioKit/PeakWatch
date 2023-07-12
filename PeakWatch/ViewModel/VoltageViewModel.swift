//
//  VoltageViewModel.swift
//  PeakWatch
//
//  Created by x on 09.06.23.
//

import Foundation
import HealthKit
import PeakSwift

class VoltageViewModel: AlgorithmSelectable {
    
    struct QRSResultsByAlgorithm {
        let qrsResult: QRSResult
        let algorithm: Algorithms
    }
    
    let ecgSample: HKElectrocardiogram
    @Published private(set) var voltageMeasurementsRaw: [HKQuantity] = []
    @Published private(set) var voltagesAllFetched: Bool = false
    @Published private(set) var voltageError: Bool = false
    
    var samplingRateValue: Double = 0.0

    @Published var selectedAlgorithms: Set<Algorithms> {
        didSet {
            qrsResultsByAlgorithm.removeAll()
            calculateAlgorithms() // It's better to instruct recalculation only to add and remove the algorithm added or removed and not all
        }
    }
    @Published private(set) var qrsResultsByAlgorithm: [QRSResultsByAlgorithm] = []
    
    let qrsDetector = QRSDetector()
    
    var voltageMeasurements: [VoltageMeasurement] {
        var measurements = self.voltageMeasurementsRaw.enumerated().map { (position, voltageMeasurementRaw) in
            VoltageMeasurement.createFromHKQuantity(position: position, hkQuantity: voltageMeasurementRaw)
        }
        qrsResultsByAlgorithm.forEach {
            qrsResultByAlgorithm in
            qrsResultByAlgorithm.qrsResult.rPeaks.forEach {
                rPeakPosition in
                measurements[Int(rPeakPosition)].isRPeakByAlgorithm.append(qrsResultByAlgorithm.algorithm)
            }
        }
        return measurements
    }
    
    let healthStore: HKHealthStore?
   
    init(ecgSample: HKElectrocardiogram) {
        self.ecgSample = ecgSample
        self.selectedAlgorithms = UserSettingsViewModel().selectedAlgorithms
        
        if HKHealthStore.isHealthDataAvailable() {
            self.healthStore = HKHealthStore()
        } else {
            self.healthStore = nil
        }
    }
    
    private func calculateAlgorithms()  {
        
        let voltages = self.voltageMeasurements.map { voltageMeasurement in voltageMeasurement.voltage }
        selectedAlgorithms.forEach {
            algorithm in
            let qrsResults = self.qrsDetector.detectPeaks(electrocardiogram: Electrocardiogram(ecg: voltages, samplingRate: self.samplingRateValue), algorithm: algorithm)
            self.qrsResultsByAlgorithm.append(QRSResultsByAlgorithm(qrsResult: qrsResults, algorithm: algorithm))
        }
        
    }
    
   
    func fetchVoltages() {
        
        guard let healthStore = healthStore else {
            return
        }
        
        let voltageQuery = HKElectrocardiogramQuery(ecgSample) { (query, result) in
            
            switch(result) {
                case .measurement(let measurement):
                    if let voltageQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
                    // Do something with the voltage quantity here.
                    DispatchQueue.main.async { [self] in
                        self.voltageMeasurementsRaw.append(voltageQuantity)
                    }
                }
            
                case .done:
                    // No more voltage measurements. Finish processing the existing measurements.
                    DispatchQueue.main.async { [self] in
                    
                        if let samplingRate = self.ecgSample.samplingFrequency {
                        self.samplingRateValue = samplingRate.doubleValue(for: .hertz())
                        calculateAlgorithms()
                        self.voltagesAllFetched = true
                        }   else {
                        self.voltageError = true
                    }
                    
                    }
                case .error(let error):
                    // Handle the error here.
                    DispatchQueue.main.async { [self] in
                    self.voltageError = true
                }
            }
        }

        // Execute the query.
        healthStore.execute(voltageQuery)

    }
    
}
