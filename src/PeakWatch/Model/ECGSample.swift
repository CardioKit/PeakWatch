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
    let startDate: Date
    let endDate: Date
    let beatsPerMinute: Double?
    let ecgSource: ECGSource
    let samplingRate: Double
    
    static let defaultSamplingRate = 512.0
    
    static func createFromHKElectrocardiogram(hkElectrocardiogramm: HKElectrocardiogram) -> ECGSample {
        .init(
                     startDate: hkElectrocardiogramm.startDate,
                     endDate: hkElectrocardiogramm.endDate,
                     beatsPerMinute: hkElectrocardiogramm.averageHeartRate?.doubleValue(for: HKUnit.count().unitDivided(by: .minute())),
                     ecgSource: .HealthKit(source: HKECG(ecg: hkElectrocardiogramm)),
                     samplingRate: hkElectrocardiogramm.samplingFrequency?.doubleValue(for: .hertz()) ?? defaultSamplingRate
        )
    }
    
    
    static func createFromExternalDataset(importedSample: ECGImportDTO) -> ECGSample {
        .init(startDate: Date(),
              endDate: Date(),
              beatsPerMinute: nil,
              ecgSource: .External(voltages: importedSample.ecg),
              samplingRate: importedSample.samplingRate)
    }
    
    static func createFromExternalDataset(ecg: [Double], samplingRate: Double) -> ECGSample {
        .init(startDate: Date(),
              endDate: Date(),
              beatsPerMinute: nil,
              ecgSource: .External(voltages: ecg),
              samplingRate: samplingRate)
    }
}
