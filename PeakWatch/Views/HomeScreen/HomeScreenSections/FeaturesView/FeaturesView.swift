//
//  FeaturesView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct FeaturesView: View {
    var body: some View {
        VStack {
            Text("Our features").modifier(HeaderViewModifier())
            VStack {
                CardView() {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            FeatureCardView(icon: "waveform.path.ecg", text: "R peaks detection")
                            FeatureCardView(icon: "star", text: "Signal quality")
                            FeatureCardView(icon: "speedometer", text: "Performance evaluation")
                        }
                    }.padding(5)
                }//.frame(maxHeight: 120)
            }
        }
    }
}
