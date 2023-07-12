//
//  FeatureCard.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import SwiftUI

struct FeatureCardView: View {
    
    
    let feature: Feature
    
    var body: some View {
        CardView(padding: 20) {
            VStack {
                Image(systemName: feature.icon)
                    .foregroundColor(Color(feature.iconColor))
                Text(feature.text)
                    .bold()
                    .foregroundStyle(Color(feature.iconColor))
            }
            .frame(maxWidth: .infinity)
        }
    }
}
