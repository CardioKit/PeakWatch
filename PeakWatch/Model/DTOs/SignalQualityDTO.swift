//
//  SignalQualityDTO.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation

struct SignalQualityDTO: Codable {
    
    let method: String
    let score: String
    let runtime: Duration
}
