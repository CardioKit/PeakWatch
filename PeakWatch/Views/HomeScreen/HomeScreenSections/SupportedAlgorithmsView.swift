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
    
    
    var body: some View {
        Section(header: Text("Algorithms supported")) {
            TagContainerView(tags: tags)
        }.headerProminence(.increased)
    }
}
