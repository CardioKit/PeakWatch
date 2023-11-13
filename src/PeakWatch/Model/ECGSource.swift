//
//  ECGSource.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 12.07.23.
//

import Foundation
import HealthKit

enum ECGSource {
    case Synthetic
    case HealthKit(source: HKECG)
    case External(voltages: [Double])
}

extension ECGSource: CustomStringConvertible {
    var description: String {
        switch self {
        case .Synthetic:
            return "Synthetic"
        case .HealthKit:
            return "HealthKit"
        case .External(_):
            return "External"
        }
    }
    
    
}
