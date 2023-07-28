//
//  ECGAlgorithmSectionView.swift
//  PeakWatch
//
//  Created by x on 12.06.23.
//

import SwiftUI

struct ECGAlgorithmSectionView: View {
    
    @ObservedObject var voltageViewModel: AlgorithmViewModel
    @Binding var showingEditAlgorithm: Bool
    
    var selectedAlgorithmsAsTags: [Tag] {
        TagUtils.createTags(from: Array(self.voltageViewModel.selectedAlgorithms))
    }
    
    var body: some View {
        HStack {
            TagContainerView(tags: selectedAlgorithmsAsTags)
        }
        Button("Select Algorithms") {
            showingEditAlgorithm.toggle()
        }
    }
}


