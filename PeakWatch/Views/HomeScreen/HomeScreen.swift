//
//  HomeScreen.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI
import PeakSwift

struct HomeScreen: View {
    
    let spacingBetweenSections = CGFloat(20)
    
                                    
    var body: some View {
        VStack {
            GoalView().padding(.top, spacingBetweenSections)
            FeaturesView().padding(.top, spacingBetweenSections)
            SupportedAlgorithmsView().padding(.top, spacingBetweenSections)
            Spacer()
            ECGNavigationView()
        }
       .navigationTitle("PeakWatch")
 
    }
}
