//
//  ECGAppleMetaData.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation

struct ECGAppleMetaDataDTO: Codable {
    
    let appleRating: String
    let beatsPerMinute: Double
    let recordingStartTime: Date
    let recordingEndtIme: Date
    
}
