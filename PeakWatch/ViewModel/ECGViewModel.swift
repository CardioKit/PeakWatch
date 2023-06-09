//
//  ECGViewModel.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import Foundation
import HealthKit

class ECGViewModel: ObservableObject {
    
    @Published private(set) var ecgs: [ECGSample] = []
    let healthStore: HKHealthStore?
    let requestedAccessPolicy = Set<HKSampleType>([.electrocardiogramType()])
    
    init(){
        if HKHealthStore.isHealthDataAvailable() {
            self.healthStore = HKHealthStore()
        } else {
            self.healthStore = nil
        }
    
    }
    
    func getECGFromHealthStore() async {
        await self.requestAuthorization()
        self.getECGSamples()
    }
    
    private func requestAuthorization() async {
    
        if let healthStore = self.healthStore {
            do {
             try await healthStore.requestAuthorization(toShare: [], read: requestedAccessPolicy)
            } catch {
             fatalError(error.localizedDescription)
            }
        }
    }
    
    private func getECGSamples() {
        
        guard let healthStore = healthStore else {
            return
        }
        
        // Create the electrocardiogram sample type.
        let ecgType = HKObjectType.electrocardiogramType()


        // Query for electrocardiogram samples
        let ecgQuery = HKSampleQuery(sampleType: ecgType,
                                     predicate: nil,
                                     limit: HKObjectQueryNoLimit,
                                     sortDescriptors: nil) { (query, samples, error) in
            if let error = error {
                // Handle the error here.
                fatalError("*** An error occurred \(error.localizedDescription) ***")
            }
            
            guard let ecgSamples = samples as? [HKElectrocardiogram] else {
                fatalError("*** Unable to convert \(String(describing: samples)) to [HKElectrocardiogram] ***")
            }
            
            let ecgSamplesTransformed = ecgSamples.map {
                (sample) -> ECGSample in
                return ECGSample.createFromHKElectrocardiogram(hkElectrocardiogramm: sample)
            }
            
            DispatchQueue.main.async { [self] in
                self.ecgs = ecgSamplesTransformed
            }
           
        }

        // Execute the query.
        healthStore.execute(ecgQuery)
    }
    
    
    
}
