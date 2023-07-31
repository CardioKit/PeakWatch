//
//  SupportedAlgorithmsView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI
import PeakSwift

struct SupportedAlgorithmsView: View {
    
    let tags = TagUtils.createTags(from: supportedAlgorithms)
    let supportedAlgorithmTitle = "Algorithms supported"
    
    
    var body: some View {
        VStack {
            Text(supportedAlgorithmTitle).modifier(HeaderViewModifier())
            CardView(style: .background, cornerRadius: 8) {
                TagContainerView(tags: tags)
            }
        }
        

    }
}
