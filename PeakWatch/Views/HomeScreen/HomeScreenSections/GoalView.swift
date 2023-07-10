//
//  GoalView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct GoalView: View {
    
    
    let goalTitle = "Goal of PeakWatch"
    let goalDescription = "The goal of PeackWatch is to demonstrate the capabilities of PeakSwift, a Swift package for detecting R peaks in Electrocardiogramms."
    
    var body: some View {
            VStack {
                Text(goalTitle).modifier(HeaderViewModifier())
                CardView(padding: 15) {
                Text(goalDescription)
            }
        }
    }
}
