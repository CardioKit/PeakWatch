//
//  FeaturesView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct FeaturesView: View {
    var body: some View {
        Section(header: Text("Our features")) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CardView(icon: "waveform.path.ecg", text: "R peaks detection")
                    CardView(icon: "star", text: "Signal quality")
                    CardView(icon: "speedometer", text: "Performance evaluation")
                }.padding(10)
            }
        }.headerProminence(.increased)
    }
}
