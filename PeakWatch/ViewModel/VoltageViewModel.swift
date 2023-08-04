//
//  OnlyVoltageViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 27.07.23.
//

import Foundation
import HealthKit

class VoltageViewModel: ObservableObject {
    
    @Published private(set) var voltageMeasurementsRaw: [HKQuantity] = []
    var voltageMeasurements: [VoltageMeasurement] {
        voltageMeasurementsRaw.enumerated().map { (position, measurement) in
            VoltageMeasurement.createFromHKQuantity(position: position, hkQuantity: measurement)
        }
    }
    @Published private(set) var voltagesAllFetched: Bool = false
    @Published private(set) var voltageError: Bool = false

    
    let healthStore: HKHealthStore?
    let ecgSample: ECGSample
    
    var samplingRateValue: Double {
        ecgSample.samplingRate
    }
    
    var voltageMeasurementsNoMetaData: [Double] {
        self.voltageMeasurements.map { voltageWithMetaData in
            voltageWithMetaData.voltage
        }
    }
    
    var maxVoltage: Double {
        voltageMeasurements.max { (v1,v2) in
            v1.voltage < v2.voltage
        }?.voltage ?? 0
    }
    
    var minVoltage: Double {
        voltageMeasurements.min { (v1,v2) in
            v1.voltage < v2.voltage
        }?.voltage ?? 0
    }

   
    init(ecgSample: ECGSample) {
        self.ecgSample = ecgSample
        
        if HKHealthStore.isHealthDataAvailable() {
            self.healthStore = HKHealthStore()
        } else {
            self.healthStore = nil
        }
    }
    
    func fetchVoltages(maxSamples: Int? = nil) async {

        switch ecgSample.ecgSource {
        case .Synthetic:
            #warning("TODO not implemented")
        case .HealthKit(let source):
            fetchVoltagesHealthKit(ecgSample: source, maxSamples: maxSamples)
        }

    }
    
    func fetchVoltagesHealthKit(ecgSample: HKElectrocardiogram, maxSamples: Int? = nil) {
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
                        self.afterFetchAllVoltagesCallback()
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
                        self.afterFetchAllVoltagesCallback()
                    
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
    
    // Template method. Can be overriden by subclasses
    // Default behaviour empty
    func afterFetchAllVoltagesCallback() {
        
    }
}
