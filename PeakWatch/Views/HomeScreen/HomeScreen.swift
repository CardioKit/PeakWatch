//
//  HomeScreen.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI
import PeakSwift

struct HomeScreen: View {
    
                                    
    var body: some View {
        VStack {
            GoalView().padding(.top, 40)
            FeaturesView().padding(.top, 40)
            SupportedAlgorithmsView().padding(.top, 40)
            Spacer()
            ECGNavigationView()
        }
       .navigationTitle("PeakWatch")
 
    }
}
