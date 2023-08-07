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
        let date = DateUtils.formatDateForTitle(date: self.appleMetaData.recordingStartTime)
        return createFileName(deviceID: deviceID, suffix: date)
    }
    
}

extension AllECGExportDTO: FileExportable {
    
    var createFileName: String {
        let deviceID = UUID()
        let suffix = "All"
        return createFileName(deviceID: deviceID, suffix: suffix)
    }
    
}
