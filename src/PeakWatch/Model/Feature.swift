//
//  Feature.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import Foundation
import SwiftUI

struct Feature: Identifiable {
    
    let id = UUID()
    let icon: String
    let iconColor: UIColor
    let text: String
}
