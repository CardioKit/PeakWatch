//
//  ECGAlgorithmSectionView.swift
//  PeakWatch
//
//  Created by x on 12.06.23.
//

import SwiftUI

struct ECGAlgorithmSectionView: View {
    
    @ObservedObject var voltageViewModel: VoltageViewModel
    @Binding var showingEditAlgorithm: Bool
    
    var body: some View {
        HStack {
            ForEach(Array(self.voltageViewModel.selectedAlgorithms)) {
                algorithm in
                Text(algorithm.description).modifier(TagViewModifier())
            }
        }
        Button("Select Algorithms") {
            showingEditAlgorithm.toggle()
        }
    }
}


