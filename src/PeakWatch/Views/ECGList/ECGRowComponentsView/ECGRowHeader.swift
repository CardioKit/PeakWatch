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
            switch ecg.ecgSource {
            case .Synthetic:
                Text("Synthetic")
            case .HealthKit(let source):
                Text(source.classification.description).bold()
            }
            Spacer()
            Text(DateUtils.formatDate(date: ecg.startDate))
        }
    }
}
