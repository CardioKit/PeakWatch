//
//  ECGAlgorithmSheetView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import SwiftUI

struct ECGAlgorithmSheetView: View {
    
    @ObservedObject var algorithmViewModel: AlgorithmViewModel
    
    var body: some View {
        NavigationView {
            AlgorithmSelectionView(algorithmViewModel: self.algorithmViewModel, listTitle: "Algorithms")
                .navigationTitle( "\(algorithmViewModel.selectedAlgorithms.count) algorithms selected")
        }
    }
}

