//
//  SingleAlgorithmViewModel.swift
//  PeakWatch
//
//  Created by x on 28.06.23.
//

import Foundation
import HealthKit
import PeakSwift

class SingleAlgorithmViewModel: ObservableObject {
    
    private let voltageMeasurementsRaw: [HKQuantity]
    private let samplingRate: Double
    private(set) var algorithm: Algorithms
    private(set) var qrsResult: QRSResult
    
    let qrsDetector = QRSDetector()
    
    init(voltageMeasurementsRaw: [HKQuantity], samplingRate: Double, algorithm: Algorithms) {
        self.voltageMeasurementsRaw = voltageMeasurementsRaw
        self.algorithm = algorithm
        self.samplingRate = samplingRate
        
        let voltageMeasurements = voltageMeasurementsRaw.map {
            measurement in
            measurement.doubleValue(for: HKUnit.volt())
        }
        
        qrsResult = qrsDetector.detectPeaks(electrocardiogram: Electrocardiogram(ecg: voltageMeasurements, samplingRate: samplingRate), algorithm: algorithm)
        
    }
    
    
    
    
}
