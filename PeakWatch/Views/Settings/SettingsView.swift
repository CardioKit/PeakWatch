//
//  SettingsView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import SwiftUI
import PeakSwift

struct SettingsView: View {
    
    @StateObject var defaultAlgorithmViewModel = DefaultAlgorithmsViewModel()
    
    
    var body: some View {
        AlgorithmSelectionView(voltageViewModel: defaultAlgorithmViewModel)
    }
}

