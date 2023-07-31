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
        CardView(style: .background, padding: 20) {
            VStack {
                Image(systemName: feature.icon)
                    .font(.system(size: 30))
                    .foregroundColor(Color(feature.iconColor))
                    .padding(.bottom, 1)
                Text(feature.text)
                    .bold()
                    .foregroundStyle(Color(feature.iconColor))
            }
            .frame(maxWidth: .infinity)
        }
    }
}
