//
//  FeaturesView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct FeaturesView: View {
    
    let features = [
        Feature(icon: "waveform.path.ecg", iconColor: .gray, text: "R-peaks"),
        Feature(icon: "star.fill", iconColor: .gray, text: "Signal quality"),
        Feature(icon: "speedometer", iconColor: .gray, text: "Context"),
        Feature(icon: "icloud.fill", iconColor: .gray, text: "Open source")
    ]
    
    let numberOfFeaturesPerRow = 2
    
    // Groupes the features dynamically per row
    var featuresPerRow: [FeatureRow] {
        let featuresGroupedByRows: [[Feature]] = features.enumerated().reduce([]) { prev, next in
            let (i, feature) = next
            var nextAccumulator = prev
            if i % numberOfFeaturesPerRow == 0 {
                nextAccumulator.append([feature])
            } else {
                nextAccumulator[nextAccumulator.count-1].append(feature)
            }
            return nextAccumulator
        }
        
        return featuresGroupedByRows.map {
            FeatureRow(featureRow: $0)
        }
    }
    
    var body: some View {
        VStack {
            Text("Features").modifier(HeaderViewModifier())
            VStack {
                CardView(style: .background) {
                    Grid {
                        ForEach(featuresPerRow) { row in
                            GridRow {
                                ForEach(row.featureRow) { item in
                                    FeatureCardView(feature: item).shadow(radius: 2)
                                    
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                }
            }
        }
    }
}
