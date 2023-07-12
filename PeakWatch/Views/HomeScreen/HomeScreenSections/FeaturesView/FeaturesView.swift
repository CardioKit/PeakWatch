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
        Feature(icon: "speedometer", iconColor: .systemOrange, text: "Remote analysis")
    ]
    
    var body: some View {
        VStack {
            Text("Our features").modifier(HeaderViewModifier())
            VStack {
                CardView {
                    Grid {
                            GridRow {
                                FeatureCardView(feature: features[0])
                                FeatureCardView(feature: features[1])
                            }
                            GridRow {
                                FeatureCardView(feature: features[2])
                                FeatureCardView(feature: features[3])
                            }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(5)
                }
            }
        }
    }
}
