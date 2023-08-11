//
//  AlgorithmSelectionView.swift
//  PeakWatch
//
//  Created by x on 12.06.23.
//

import SwiftUI
import PeakSwift

struct AlgorithmSelectionView<AlgorithmViewModel: AlgorithmSelectable>: View {
    
    @State var editMode: EditMode = .active
        
    @ObservedObject var algorithmViewModel: AlgorithmViewModel
    
    let listTitle: String
    
    
    var body: some View {
                List(selection: $algorithmViewModel.selectedAlgorithms) {
                    Section(listTitle) {
                        ForEach(supportedAlgorithms) { algorithm in
                            Text(algorithm.description)
                        }
                    }.headerProminence(.increased)
                }
                .environment(\.editMode, $editMode)
    }
}
