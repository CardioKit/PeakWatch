//
//  ECGRowDetailsView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 12.07.23.
//

import SwiftUI

struct ECGRowDetailsView: View {
    
    let ecg: ECGSample
    
    var beatsPerMinuteLabel: String {
        if let beatsPerMinute = ecg.beatsPerMinute {
            return String(format: "%.f", beatsPerMinute)
        } else {
            return "Unknown"
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: "heart.fill").foregroundColor(.red)
            Text("\(beatsPerMinuteLabel)  BPM").foregroundColor(.secondary)
            Spacer()
            Text(ecg.ecgSource.rawValue).foregroundColor(.secondary)
        }
    }
}
