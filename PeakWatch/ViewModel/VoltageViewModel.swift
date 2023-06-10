//
//  VoltageViewModel.swift
//  PeakWatch
//
//  Created by x on 09.06.23.
//

import Foundation
import HealthKit

class VoltageViewModel: ObservableObject {
    
    let ecgSample: HKElectrocardiogram
    @Published private(set) var voltageMeasurements: [HKQuantity] = []
    @Published private(set) var voltagesAllFetched: Bool = false
    @Published private(set) var voltageError: Bool = false
    
    let healthStore: HKHealthStore?
   
    init(ecgSample: HKElectrocardiogram) {
        self.ecgSample = ecgSample
        if HKHealthStore.isHealthDataAvailable() {
            self.healthStore = HKHealthStore()
        } else {
            self.healthStore = nil
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
                    self.voltageMeasurements.append(voltageQuantity)
                }
            
            case .done:
                // No more voltage measurements. Finish processing the existing measurements.
                self.voltagesAllFetched = true
            case .error(let error):
                // Handle the error here.
                self.voltageError = true
            }
        }

        // Execute the query.
        healthStore.execute(voltageQuery)

    }
    
}
