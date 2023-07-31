//
//  ECGExport.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation

struct ECGExportDTO: Codable {
    
    let ecg: ECGInformationDTO
    let appleMetaData: ECGAppleMetaDataDTO
    let algorithms: [RPeaksDTO]
    let signalQuality: [SignalQualityDTO]
}
