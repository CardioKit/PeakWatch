//
//  SupportedAlgorithmsView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI
import PeakSwift

struct SupportedAlgorithmsView: View {
    
    let supportedAlgorithms: [Algorithms] = [.Nabian2018, .Christov, .Basic, .WQRS, .Aristotle, .Nabian2018]
    
    var supportedAlgorithmsAsTags: [Tag] {
        self.supportedAlgorithms.map { algorithm in
            Tag(text: algorithm.description)
        }
    }
    
    var body: some View {
        Section(header: Text("Algorithms supported")) {
            TagContainerView(tags: supportedAlgorithmsAsTags)
        }.headerProminence(.increased)
    }
}
