//
//  GoalView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct GoalView: View {
    
    
    let objectiveTitle = "PeakWatch"
    let objectiveDescription = "The objective of PeakWatch is to demonstrate the capabilities of PeakSwift, a Swift package for detecting R peaks in Electrocardiograms."
    
    var body: some View {
            VStack {
                Text(objectiveTitle).modifier(HeaderViewModifier())
                CardView(style: Colors.cardColor.value, padding: 15, cornerRadius: 8) {
                Text(objectiveDescription)
                }
        }
    }
}
