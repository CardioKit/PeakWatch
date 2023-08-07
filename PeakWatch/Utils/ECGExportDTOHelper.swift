//
//  ECGExportDTOHelper.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 01.08.23.
//

import Foundation
import SwiftUI

struct ECGExportDTOHelper<ExportDTO: Codable> {
    
    static var jsonEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
    
    static func convertToJSON(ecgExportDTO: ExportDTO) throws -> Data {
        let encodedData = try jsonEncoder.encode(ecgExportDTO)
        return encodedData
    }
    
    static func createFileName(deviceID: UUID?, suffix: String) -> String {
        let deviceName = deviceID?.uuidString ?? "unknown"
        return "PW_ECG_\(deviceName)_\(suffix)"
    }
}


extension ECGExportDTOHelper where ExportDTO == ECGExportDTO {
    
    static func createFileName(ecgExportDTO: ECGExportDTO) -> String {
        let deviceID = ecgExportDTO.deviceID
        let date = DateUtils.formatDateForTitle(date: ecgExportDTO.appleMetaData.recordingStartTime)
        return  createFileName(deviceID: deviceID, suffix: date)
    }
}

extension ECGExportDTOHelper where ExportDTO == AllECGExportDTO {
    
    static func createFileName(ecgExportDTO: AllECGExportDTO) -> String {
        let deviceID = UUID()
        let suffix = "All"
        return  createFileName(deviceID: deviceID, suffix: suffix)
    }
    
}
