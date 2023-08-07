//
//  AlgorithmViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 28.07.23.
//

import Foundation
import PeakSwift

class AlgorithmViewModel: VoltageViewModel & AlgorithmSelectable {
    
    var exportResults: ECGExportDTO? {
        // Only allow export, when all algorithms are executed
        print("processed: \(qrsResultsByAlgorithm.count) of \(selectedAlgorithms.count)")
        guard qrsResultsByAlgorithm.count == selectedAlgorithms.count else {
            return nil
        }
        
        return ECGExportDTO.createECGExportDTO(algorithmViewModel: self)
    }
    
    var voltageMeasurementsWithPeaks: [VoltageMeasurementWithPeak] {
        var measurements = self.voltageMeasurements.map { measurement in
            VoltageMeasurementWithPeak(position: measurement.position, voltage: measurement.voltage)
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
        
        var qrsResultByAlgorithmBuffer: [QRSResultsByAlgorithm] = []
        selectedAlgorithms.forEach {
            algorithm in
            let qrsResults = calculateAlgorithm(algorithm: algorithm, voltages: voltages)
            qrsResultByAlgorithmBuffer.append(qrsResults)
        }
        
        DispatchQueue.main.async {
            self.qrsResultsByAlgorithm = qrsResultByAlgorithmBuffer
        }
        
    }
    

    private func calculateAlgorithm(algorithm: Algorithms, voltages: [Double]) -> QRSResultsByAlgorithm {
        
        let clock = ContinuousClock()
        var qrsResults: QRSResult?
        
        let duration = clock.measure {
            qrsResults = self.qrsDetector.detectPeaks(electrocardiogram: Electrocardiogram(ecg: voltages, samplingRate: self.ecgSample.samplingRate), algorithm: algorithm)
        }
        
        return .init(qrsResult: qrsResults!, algorithm: algorithm, duration: duration)
    }
    

    override func afterFetchAllVoltagesCallback() async {
        print("start calculation")
        calculateAlgorithms()
        print("end calculation \(qrsResultsByAlgorithm.count)")
    }
    
}
