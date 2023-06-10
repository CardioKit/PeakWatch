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
    @Published private(set) var voltageMeasurementsRaw: [HKQuantity] = []
    @Published private(set) var voltagesAllFetched: Bool = false
    @Published private(set) var voltageError: Bool = false
    
    var voltageMeasurements: [VoltageMeasurement] {
        self.voltageMeasurementsRaw.enumerated().map { (position, voltageMeasurementRaw) in
            VoltageMeasurement.createFromHKQuantity(position: position, hkHKQuantity: voltageMeasurementRaw)
        }
    }
    
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
                    DispatchQueue.main.async { [self] in
                        self.voltageMeasurementsRaw.append(voltageQuantity)
                    }
                }
            
            case .done:
                // No more voltage measurements. Finish processing the existing measurements.
                DispatchQueue.main.async { [self] in
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
