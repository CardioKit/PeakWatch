//
//  AlgorithmViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 28.07.23.
//

import Foundation
import PeakSwift

class AlgorithmViewModel: OnlyVoltageViewModel & AlgorithmSelectable {
    
    
    struct QRSResultsByAlgorithm {
        let qrsResult: QRSResult
        let algorithm: Algorithms
    }
    
    var voltageMeasurementsWithPeaks: [VoltageMeasurement] {
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
    
    @Published var selectedAlgorithms: Set<Algorithms> = UserSettingsViewModel().selectedAlgorithms {
        didSet {
            qrsResultsByAlgorithm.removeAll()
            calculateAlgorithms() // It's better to instruct recalculation only to add and remove the algorithm added or removed and not all
        }
    }
    @Published private(set) var qrsResultsByAlgorithm: [QRSResultsByAlgorithm] = []
    
    let qrsDetector = QRSDetector()
    
    
    private func calculateAlgorithms()  {
        
        let voltages = self.voltageMeasurements.map { voltageMeasurement in voltageMeasurement.voltage }
        selectedAlgorithms.forEach {
            algorithm in
            let qrsResults = self.qrsDetector.detectPeaks(electrocardiogram: Electrocardiogram(ecg: voltages, samplingRate: self.ecgSample.samplingRate), algorithm: algorithm)
            self.qrsResultsByAlgorithm.append(QRSResultsByAlgorithm(qrsResult: qrsResults, algorithm: algorithm))
        }
        
    }
    
    override func afterFetchAllVoltagesCallback() {
        calculateAlgorithms()
    }
}
