//
//  HKECG.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 13.11.23.
//

import Foundation
import HealthKit

struct HKECG {

    let ecg: HKElectrocardiogram
    
    var classification: HKElectrocardiogram.Classification {
        ecg.classification
    }
    
    var numberOfVoltages: Int {
        ecg.numberOfVoltageMeasurements
    }
    
}
