//
//  SupportedAlgorithmsView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI
import PeakSwift

struct AlgorithmsTagsGridView: View {
    
    let tags: [Tag]
    let title: String
    
    init(title: String, algorithms: [CustomStringConvertible]) {
        self.title = title
        self.tags = TagUtils.createTags(from: algorithms)
    }
    
    var body: some View {
        VStack {
            Text(title).modifier(HeaderViewModifier())
            CardView(style: .background, cornerRadius: 8) {
                TagContainerView(tags: tags)
            }
        }
        

    }
}
