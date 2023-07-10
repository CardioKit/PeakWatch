//
//  FeaturesView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct FeaturesView: View {
    
    let features = [
        Feature(icon: "waveform.path.ecg", text: "R peaks detection"),
        Feature(icon: "star", text: "Signal quality"),
        Feature(icon: "speedometer", text: "Performance evaluation")
    ]
    
    var body: some View {
        VStack {
            Text("Our features").modifier(HeaderViewModifier())
            VStack {
                CardView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(features) { feature in
                                FeatureCardView(feature: feature)
                            }
                        }
                    }.padding(5)
                }
            }
        }
    }
}
