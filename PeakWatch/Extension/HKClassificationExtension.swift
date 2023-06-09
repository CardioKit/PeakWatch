//
//  HKClassificationExtension.swift
//  PeakWatch
//
//  Created by x on 09.06.23.
//

import Foundation
import HealthKit

extension HKElectrocardiogram.Classification: CustomStringConvertible {
    public var description: String {
        switch self {
        case .notSet:
            return "Not set"
        case .sinusRhythm:
            return "Sinus rhytm"
        case .atrialFibrillation:
            return "Artial Fibrillation"
        case .inconclusiveLowHeartRate:
            return "Inconclusive low heart rate"
        case .inconclusiveHighHeartRate:
            return "Inconclusive high heart rate"
        case .inconclusivePoorReading:
            return "Inconclusive poor reading"
        case .inconclusiveOther:
            return "Inconclusive"
        case .unrecognized:
            return "Unrecognized"
        @unknown default:
            return "Not supported symptom"
        }
    }
    
    
}
