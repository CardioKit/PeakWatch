//
//  ECGSingleAlgorithmSelectionView.swift
//  PeakWatch
//
//  Created by x on 28.06.23.
//

import SwiftUI
import PeakSwift

struct ECGSingleAlgorithmSelectionView: View {
    
    @ObservedObject var voltageViewModel: VoltageViewModel
    
    var body: some View {
        ForEach(Array(self.voltageViewModel.qrsResultsByAlgorithm), id: \.algorithm) {
            qrsResultByAlgorithm in
            NavigationLink(destination: ECGSingleAlgorithmDetailView(qrsResult: qrsResultByAlgorithm.qrsResult, algorithm: qrsResultByAlgorithm.algorithm) ) {
                Text(qrsResultByAlgorithm.algorithm.description)
            }
        }
    }
}

