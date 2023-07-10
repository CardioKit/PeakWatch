//
//  ECGSample.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import Foundation
import HealthKit


struct ECGSample: Identifiable {
    
    let id = UUID()
    let numberOfVoltageMeasurements: Int
    let startDate: Date
    let endDate: Date
    let device: String
    let classification: HKElectrocardiogram.Classification
    let beatsPerMinute: Double?
    
    
    static func createFromHKElectrocardiogram(hkElectrocardiogramm: HKElectrocardiogram) -> ECGSample {
        hkElectrocardiogramm.averageHeartRate?.doubleValue(for: HKUnit.count().unitDivided(by: .minute()))
        return .init(numberOfVoltageMeasurements: hkElectrocardiogramm.numberOfVoltageMeasurements,
                     startDate: hkElectrocardiogramm.startDate,
                     endDate: hkElectrocardiogramm.endDate,
                     device: hkElectrocardiogramm.device?.name ?? "Unknown device",
                     classification: hkElectrocardiogramm.classification,
                     beatsPerMinute: hkElectrocardiogramm.averageHeartRate?.doubleValue(for: HKUnit.count().unitDivided(by: .minute())
                                                                                       )
        )
    }
    
    static func mock() -> ECGSample {
        return .init(numberOfVoltageMeasurements: 14560, startDate: Date(), endDate: Date(), device: "AppleWatch", classification: .sinusRhythm, beatsPerMinute: 10)
    }
    
}
