//
//  RPeaks.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation

struct RPeaksDTO: Codable {
    
    let algorithm: String
    let rPeaks: [Int]
    let duration: Duration
}
