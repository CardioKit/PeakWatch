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
            HStack {
                Image(systemName: feature.icon)
                Text(feature.text)
            }
        }
    }
}
