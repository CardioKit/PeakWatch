//
//  ECGQualityRowView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import SwiftUI

struct ECGQualityRowView: View {
    
    let ecgQuality: ECGQuality
    
    var runtime: String {
        let formattedInMs = String(format: "%.2f", ecgQuality.runtime.inMilliseconds)
        return "\(formattedInMs) ms"
    }
    
    let runTimeIcon = "timer"
    
    var body: some View {
        CardWithHeader(headerIcon: "", headerTitle: ecgQuality.algorithm.description) {
            HStack {
                Text(ecgQuality.qualityRating.description)
                Spacer()
                Image(systemName: runTimeIcon)
                Text(runtime)
            }
        }
    }
}
