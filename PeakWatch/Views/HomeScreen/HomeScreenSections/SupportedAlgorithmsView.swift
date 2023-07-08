//
//  SupportedAlgorithmsView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI
import PeakSwift

struct SupportedAlgorithmsView: View {
    
    let supportedAlgorithms: [Algorithms] = [.Nabian2018, .Christov, .Basic, .WQRS, .Aristotle]
    
    var body: some View {
        Section(header: Text("Algorithms supported")) {
            HStack {
                ForEach(supportedAlgorithms, id: \.self) { algorithm in
                    Text(algorithm.description).modifier(TagViewModifier())
                }
            }
        }.headerProminence(.increased)
    }
}
