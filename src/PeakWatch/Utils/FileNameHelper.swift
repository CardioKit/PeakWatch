//
//  FileNameHelper.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 14.11.23.
//

import Foundation

enum FileNameHelper {
    
    static func createFileName(deviceID: UUID?, suffix: String) -> String {
        let deviceName = deviceID?.uuidString ?? "unknown"
        return "PW_ECG_\(deviceName)_\(suffix)"
    }
    
    static func createFileName(suffix: String) -> String {
        createFileName(deviceID: DeviceDataUtils.deviceId, suffix: suffix)
        
    }
    
}
