//
//  HomeScreen.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct HomeScreen: View {
                                         
    var body: some View {
        List {
            GoalView()
            FeaturesView()
            SupportedAlgorithmsView()
            ECGNavigationView()
        }.navigationTitle("PeakWatch")
    }
}
