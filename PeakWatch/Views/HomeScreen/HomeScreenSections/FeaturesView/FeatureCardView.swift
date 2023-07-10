//
//  FeatureCard.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import SwiftUI

struct FeatureCardView: View {
    
    
    var icon: String
    var text: String
    
    var body: some View {
        CardView() {
            HStack {
                Image(systemName: icon)
                Text(text)
            }.padding(10)
        }//.frame(maxHeight: 80)
    }
}
