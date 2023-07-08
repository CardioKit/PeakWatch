//
//  HomeScreen.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI
import PeakSwift

struct HomeScreen: View {
    
    let supportedAlgorithms: [Algorithms] = [.Nabian2018, .Christov, .Basic, .WQRS, .Aristotle]
    
    var supportedAlgorithmsAsTags: [Tag] {
        self.supportedAlgorithms.map { algorithm in
            Tag(text: algorithm.description)
        }
    }
    
                                         
    var body: some View {
        List {
            GoalView()
            FeaturesView()
            SupportedAlgorithmsView()
            ECGNavigationView()
        }.navigationTitle("PeakWatch")
 
    }
}
