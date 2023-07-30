//
//  FeaturesView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct FeaturesView: View {
    
    let features = [
        Feature(icon: "waveform.path.ecg", iconColor: .cyan, text: "R peaks"),
        Feature(icon: "star.fill", iconColor: .systemYellow, text: "Signal quality"),
        Feature(icon: "speedometer", iconColor: .systemGreen, text: "Context"),
        Feature(icon: "icloud.fill", iconColor: .systemOrange, text: "Remote analysis")
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
            Text("Our features").modifier(HeaderViewModifier())
            VStack {
                CardView(style: .quaternary) {
                    Grid {
                        ForEach(featuresPerRow) { row in
                            GridRow {
                                ForEach(row.featureRow) { item in
                                    FeatureCardView(feature: item)
                                    
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(5)
                }
            }
        }
    }
}
