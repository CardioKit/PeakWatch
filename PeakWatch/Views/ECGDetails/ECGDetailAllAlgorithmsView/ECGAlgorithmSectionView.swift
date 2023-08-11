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
    
    let buttonLabel = "Select Algorithms"
    
    var body: some View {
        Button(buttonLabel) {
            showingEditAlgorithm.toggle()
        }
    }
}


