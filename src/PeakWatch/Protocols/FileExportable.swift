//
//  FileExportable.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 07.08.23.
//

import Foundation
import SwiftUI

protocol FileExportable: Codable {
    
    var createFileName: String { get }
    func createFileName(deviceID: UUID?, suffix: String) -> String
    
}

extension FileExportable {
    
     func createFileName(deviceID: UUID?, suffix: String) -> String {
        let deviceName = deviceID?.uuidString ?? "unknown"
        return "PW_ECG_\(deviceName)_\(suffix)"
    }
    
}

extension ECGExportDTO: FileExportable {
    
    var createFileName: String {
        let deviceID = self.deviceID
        var suffix = "ExternalSource"
        if let appleMetaData = self.appleMetaData {
            suffix = DateUtils.formatDateForTitle(date: appleMetaData.recordingStartTime)
        }
        return createFileName(deviceID: deviceID, suffix: suffix)
    }
    
}

extension AllECGExportDTO: FileExportable {
    
    var createFileName: String {
        let deviceID = DeviceDataUtils.deviceId
        let suffix = "All"
        return createFileName(deviceID: deviceID, suffix: suffix)
    }
    
}
