//
//  ECGSingleAlgorithmPerformanceView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 29.07.23.
//

import SwiftUI
import PeakSwift

struct ECGSingleAlgorithmPerformanceView: View {
    
    let executionTime: Duration
    
    let icon = "speedometer"
    let title = "Execution time"
    
    let timeLabel = "ms"
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
            .font(.system(size: 12,  weight: .bold))
            .foregroundColor(.red)
            HStack(alignment: .bottom) {
                Text(String(format: "%.6f", executionTime.inMilliseconds))
                    .font(.system(size: 24, weight: .bold))
                Text(timeLabel)
                    .fontWeight(.ultraLight)
            }
        }
    }
}
