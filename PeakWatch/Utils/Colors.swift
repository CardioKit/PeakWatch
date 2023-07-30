//
//  Colors.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 30.07.23.
//

import Foundation
import SwiftUI

enum Colors {
    
    case cardColor
    case cardHeader
    case background
    
    var value: Color {
        switch self {
        case .cardColor:
            return Color("CardColor")
        case .cardHeader:
            return Color("CardHeader")
        case .background:
            return Color("Background")
            
        }
    }
}
