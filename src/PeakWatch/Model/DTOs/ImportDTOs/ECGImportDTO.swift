//
//  ImportECGDTO.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 13.11.23.
//

import Foundation

struct ECGImportDTO: Decodable {
        
    let ecg: [Double]
    let samplingRate: Double
    
}
