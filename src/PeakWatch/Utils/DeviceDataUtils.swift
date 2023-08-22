//
//  DeviceDataUtils.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.08.23.
//

import Foundation
import SwiftUI

enum DeviceDataUtils {
    
    // The id should be unique. The same id is generated for apps that come from the same vendor running on the same device.
    static var deviceId: UUID? {
        UIDevice.current.identifierForVendor
    }
}
