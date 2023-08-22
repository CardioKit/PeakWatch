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
    let paddingBetweenLeftRight = CGFloat(5)
    @Binding var isSheetOpen: Bool
    
                                    
    var body: some View {
        VStack {
                GoalView()
                    .padding(.top, spacingBetweenSections)
                FeaturesView()
                    .padding(.top, spacingBetweenSections)
                    .padding([.leading, .trailing], paddingBetweenLeftRight)
            AlgorithmsTagsGridView(title: "Algorithms supported", algorithms: supportedAlgorithms)
                    .padding(.top, spacingBetweenSections)
                    .padding([.leading, .trailing], paddingBetweenLeftRight)
                Spacer()
                ECGNavigationView(isSheetOpen: $isSheetOpen)
                    .padding([.leading, .trailing], paddingBetweenLeftRight)
        }.background(Colors.background.value)
 
    }
}
