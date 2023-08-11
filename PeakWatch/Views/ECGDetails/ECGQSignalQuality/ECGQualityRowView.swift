//
//  ECGQualityRowView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import SwiftUI

struct ECGQualityRowView: View {
    
    let ecgQuality: ECGQuality
    
    var algortihmName: String {
        let algorithm = ecgQuality.algorithm.algorithmName
        let method = ecgQuality.algorithm.methodName
        
        var suffix = ""
        
        if let method = method {
            suffix = " (\(method))"
        }
        
        return algorithm + suffix
    }
    
    var runtime: String {
        let formattedInMs = String(format: "%.2f", ecgQuality.duration.inMilliseconds)
        return "\(formattedInMs) ms"
    }
    
    let runTimeIcon = "timer"
    
    var body: some View {
        CardWithHeader(headerIcon: "", headerTitle: algortihmName) {
            HStack {
                Text(ecgQuality.qualityRating.description)
                Spacer()
                Image(systemName: runTimeIcon)
                Text(runtime)
            }
        }
    }
}
