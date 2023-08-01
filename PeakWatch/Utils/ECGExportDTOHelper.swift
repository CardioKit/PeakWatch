//
//  ECGExportDTOHelper.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 01.08.23.
//

import Foundation
import SwiftUI

enum ECGExportDTOHelper {
    
    static func convertToJSON(ecgExportDTO: ECGExportDTO) throws -> Data {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let encodedData = try encoder.encode(ecgExportDTO)
        return encodedData
    }
    
    static func createFileName(ecgExportDTO: ECGExportDTO) -> String {
        let deviceName = ecgExportDTO.deviceID?.uuidString ?? "unknown"
        let date = DateUtils.formatDateForTitle(date: ecgExportDTO.appleMetaData.recordingStartTime)
        return "PW_ECG_\(deviceName)_\(date)"
    }
    
}
