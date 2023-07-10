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
        
    @ObservedObject var voltageViewModel: AlgorithmViewModel
    
    let algorithms: [Algorithms] = [.nabian2018, .christov,
        //.GQRS, - not implemented
                                    .basic, .wqrs, .aristotle, .hamiltonCleaned, .hamilton, .panTompkins, .twoAverage]
    
    
    var body: some View {
                List(selection: $voltageViewModel.selectedAlgorithms) {
                    Section("Algorithms") {
                        ForEach(algorithms) { algorithm in
                            Text(algorithm.description)
                        }
                    }.headerProminence(.increased)
                }
                //.navigationTitle(title(voltageViewModel.selectedAlgorithms.count))
                .environment(\.editMode, $editMode)
    }
}
