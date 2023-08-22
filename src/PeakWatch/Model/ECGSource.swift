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
    case HealthKit(source: HKElectrocardiogram)
}

extension ECGSource: CustomStringConvertible {
    var description: String {
        switch self {
        case .Synthetic:
            return "Synthetic"
        case .HealthKit:
            return "HealthKit"
        }
    }
    
    
}
