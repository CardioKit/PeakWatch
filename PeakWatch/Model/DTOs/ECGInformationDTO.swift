//
//  ECGInformation.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation

struct ECGInformationDTO: Codable {
    
    let ecg: [Double]
    let samplingRate: Double
}
