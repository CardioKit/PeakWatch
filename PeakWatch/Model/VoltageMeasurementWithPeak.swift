//
//  VoltageMeasurement.swift
//  PeakWatch
//
//  Created by x on 10.06.23.
//

import Foundation
import HealthKit
import PeakSwift

class VoltageMeasurementWithPeak: VoltageMeasurement {
    
    // Stores which algorithms detected here a RPeak
    var isRPeakByAlgorithm: [Algorithms] = []
}
