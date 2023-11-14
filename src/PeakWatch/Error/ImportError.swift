//
//  ImportError.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 14.11.23.
//

import Foundation

enum ImportError: Error {
    
    case typeError(message: String)
    case fileError
}
