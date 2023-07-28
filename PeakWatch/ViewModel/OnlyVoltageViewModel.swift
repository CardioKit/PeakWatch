//
//  OnlyVoltageViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 27.07.23.
//

import Foundation
import HealthKit

class OnlyVoltageViewModel: ObservableObject {
    
    @Published private(set) var voltageMeasurementsRaw: [HKQuantity] = []
    var voltageMeasurements: [OnlyVoltageMeasurement] {
        voltageMeasurementsRaw.enumerated().map { (position, measurement) in
            OnlyVoltageMeasurement.createFromHKQuantity(position: position, hkQuantity: measurement)
        }
//        (0...1560).map { (position) in
//            OnlyVoltageMeasurement(position: position, voltage: Double.random(in: 0..<10))
//        }
    }
    @Published private(set) var voltagesAllFetched: Bool = false
    @Published private(set) var voltageError: Bool = false
    
    var voltageRequested: Bool = false
    
    let healthStore: HKHealthStore?
    let ecgSample: HKElectrocardiogram
   
    init(ecgSample: HKElectrocardiogram) {
        self.ecgSample = ecgSample
        
        if HKHealthStore.isHealthDataAvailable() {
            self.healthStore = HKHealthStore()
        } else {
            self.healthStore = nil
        }
    }
    
    func fetchVoltages(maxSamples: Int? = nil) async {
        
        guard let healthStore = healthStore else {
            return
        }
        
        var voltages: [HKQuantity] = []

        let voltageQuery = HKElectrocardiogramQuery(ecgSample) { [self] (query, result) in
            
           
            if self.voltagesAllFetched {
                return
            }
            
            if let maxSamples = maxSamples {
                guard voltages.count < maxSamples else {
                    DispatchQueue.main.async { [self] in
                        self.voltageMeasurementsRaw = voltages
                        self.voltagesAllFetched = true
                        healthStore.stop(query)
                    }
                    return
            }
        }
            
            switch(result) {
                case .measurement(let measurement):
                    if let voltageQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
                    // Do something with the voltage quantity here.
                        voltages.append(voltageQuantity)
                }
            
                case .done:
                    // No more voltage measurements. Finish processing the existing measurements.
                    DispatchQueue.main.async { [self] in
                        self.voltageMeasurementsRaw = voltages
                        self.voltagesAllFetched = true
                    
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
