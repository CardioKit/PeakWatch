//
//  OnlyVoltageMeasurement.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 27.07.23.
//

import Foundation
import HealthKit


struct OnlyVoltageMeasurement: Identifiable {
    
    let id = UUID()
    let position: Int
    let voltage: Double
    
    static func createFromHKQuantity(position: Int, hkQuantity: HKQuantity) -> OnlyVoltageMeasurement {
        return .init(position: position, voltage: hkQuantity.doubleValue(for: .volt()))
    }
    
}
