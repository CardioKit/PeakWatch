//
//  OnlyVoltageMeasurement.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 27.07.23.
//

import Foundation
import HealthKit


class VoltageMeasurement: Identifiable {
    
    let id = UUID()
    let position: Int
    let voltage: Double
    
    init(position: Int, voltage: Double) {
        self.position = position
        self.voltage = voltage
    }
    
    static func createFromHKQuantity(position: Int, hkQuantity: HKQuantity) -> VoltageMeasurement {
        return .init(position: position, voltage: hkQuantity.doubleValue(for: .volt()))
    }
    
}
