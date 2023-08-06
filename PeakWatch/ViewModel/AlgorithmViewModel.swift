//
//  AlgorithmViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 28.07.23.
//

import Foundation
import PeakSwift

class AlgorithmViewModel: VoltageViewModel & AlgorithmSelectable {
    
    var exportResults: ECGExportDTO {
            ECGExportDTO.createECGExportDTO(algorithmViewModel: self)
    }
    
    var exportTile: String {
        "ecg-sample_\(DateUtils.formatDateForTitle(date: ecgSample.startDate))"
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
        selectedAlgorithms.forEach {
            algorithm in
            let qrsResults = calculateAlgorithm(algorithm: algorithm, voltages: voltages)
            self.qrsResultsByAlgorithm.append(qrsResults)
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
    

    override func afterFetchAllVoltagesCallback() {
        calculateAlgorithms()
    }
}
