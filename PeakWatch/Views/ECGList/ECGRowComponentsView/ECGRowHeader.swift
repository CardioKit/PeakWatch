//
//  ECGHeader.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 12.07.23.
//

import SwiftUI
import HealthKit

struct ECGRowHeader: View {
    
    let ecg: ECGSample
    
    var body: some View {
        HStack {
            Text(ecg.classification.description).bold()
            Spacer()
            Text(DateUtils.formatDate(date: ecg.startDate))
        }
    }
}
