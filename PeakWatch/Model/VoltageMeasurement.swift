//
//  VoltageMeasurement.swift
//  PeakWatch
//
//  Created by x on 10.06.23.
//

import Foundation
import HealthKit

struct VoltageMeasurement: Identifiable {
    
    let id = UUID()
    let position: Int
    let voltage: Double
    
    static func createFromHKQuantity(position: Int, hkHKQuantity: HKQuantity) -> VoltageMeasurement {
        return .init(position: position, voltage: hkHKQuantity.doubleValue(for: .volt()))
    }
    
}
