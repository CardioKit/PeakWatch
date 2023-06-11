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
    var isRpeak: Bool = false
    
    static func createFromHKQuantity(position: Int, hkQuantity: HKQuantity) -> VoltageMeasurement {
        return .init(position: position, voltage: hkQuantity.doubleValue(for: .volt()))
    }
    
}
