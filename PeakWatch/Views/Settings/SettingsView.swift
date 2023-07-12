//
//  SettingsView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import SwiftUI
import PeakSwift

struct SettingsView: View {
    
    @StateObject var defaultAlgorithmViewModel = UserSettingsViewModel()
    
    let algorithmSectionTitle = "Default Algorithms"
    let settingsNavigationTitle = "User Settings"
    
    
    var body: some View {
            AlgorithmSelectionView(voltageViewModel: defaultAlgorithmViewModel,
                                   listTitle: algorithmSectionTitle)
                .navigationTitle(settingsNavigationTitle)
        
    }
}

