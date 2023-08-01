//
//  ECGAppleMetaData.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation
import HealthKit

struct ECGAppleMetaDataDTO: Codable {
    
    let appleRating: String
    let beatsPerMinute: Double
    let recordingStartTime: Date
    let recordingEndtIme: Date
    let deviceName: String?
    let manufacturer: String?
    let model: String?
    let hardwareVersion: String?
    let softwareVersion: String?
    let source: String?
    let algorithmVersion: Int?
    let addedToHealthKitDate: Date?
    
    static func createAppleMetaDataDTO(algorithmViewModel: AlgorithmViewModel) -> ECGAppleMetaDataDTO {
        let appleWatchSymptoms = algorithmViewModel.ecgSample.classification.description
        let beatsPerminute = algorithmViewModel.ecgSample.beatsPerMinute ?? 0
        let startTime = algorithmViewModel.ecgSample.startDate
        let endTime = algorithmViewModel.ecgSample.endDate
        
        switch algorithmViewModel.ecgSample.ecgSource {
        case .Synthetic:
            #warning("not implemented")
            fatalError("not implemented")
        case .HealthKit(let source):
            
            
            let deviceName = source.device?.name
            let manufacturer = source.device?.manufacturer
            let model = source.device?.model
            let hardwareVersion = source.device?.hardwareVersion
            let softwareVersion = source.device?.softwareVersion
            let sourceName = source.sourceRevision.source.name
            var algorithmVersion: Int?
            if let anyAlgorithmVersion = source.metadata?[HKMetadataKeyAppleECGAlgorithmVersion] {
                algorithmVersion = anyAlgorithmVersion as! Int
            }
            var addedToHealthKit: Date?
            if let addedToHealthKitRaw = source.value(forKey: "creationTimestamp") {
                let addedToHealthKitDouble = addedToHealthKitRaw as! Double
                addedToHealthKit = Date(timeIntervalSinceReferenceDate: addedToHealthKitDouble)
            }
            
            return .init(appleRating: appleWatchSymptoms,
                         beatsPerMinute: beatsPerminute,
                         recordingStartTime: startTime,
                         recordingEndtIme: endTime,
                         deviceName: deviceName,
                         manufacturer: manufacturer,
                         model: model,
                         hardwareVersion: hardwareVersion,
                         softwareVersion: softwareVersion,
                         source: sourceName,
                         algorithmVersion: algorithmVersion,
                         addedToHealthKitDate: addedToHealthKit
                         
            )
        }
    }
    
}
