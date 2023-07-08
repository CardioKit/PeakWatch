//
//  GoalView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct GoalView: View {
    var body: some View {
        Section(header: Text("Goal of PeakWatch")) {
            HStack {
                Text("The goal of PeackWatch is to demonstrate the capabilities of PeakSwift, a Swift package for detecting R peaks in Electrocardiogramms.")
            }
        }.headerProminence(.increased)
    }
}
