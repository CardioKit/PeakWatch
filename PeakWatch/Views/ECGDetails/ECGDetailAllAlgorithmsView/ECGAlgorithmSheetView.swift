//
//  ECGAlgorithmSheetView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import SwiftUI

struct ECGAlgorithmSheetView: View {
    
    @ObservedObject var voltageViewModel: VoltageViewModel
    
    var body: some View {
        NavigationView {
            AlgorithmSelectionView(voltageViewModel: self.voltageViewModel, listTitle: "Algorithms")
                .navigationTitle( "\(voltageViewModel.selectedAlgorithms.count) algorithms selected")
        }
    }
}

