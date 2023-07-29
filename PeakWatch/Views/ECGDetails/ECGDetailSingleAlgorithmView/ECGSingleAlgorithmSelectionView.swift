//
//  ECGSingleAlgorithmSelectionView.swift
//  PeakWatch
//
//  Created by x on 28.06.23.
//

import SwiftUI
import PeakSwift

struct ECGSingleAlgorithmSelectionView: View {
    
    @ObservedObject var algorithmViewModel: AlgorithmViewModel
    
    var body: some View {
        ForEach(Array(self.algorithmViewModel.qrsResultsByAlgorithm), id: \.algorithm) {
            qrsResultByAlgorithm in
            NavigationLink(destination: ECGSingleAlgorithmDetailView(qrsResult: qrsResultByAlgorithm, algorithm: qrsResultByAlgorithm.algorithm) ) {
                Text(qrsResultByAlgorithm.algorithm.description)
            }
        }
    }
}

