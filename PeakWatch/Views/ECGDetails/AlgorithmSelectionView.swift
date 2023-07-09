//
//  AlgorithmSelectionView.swift
//  PeakWatch
//
//  Created by x on 12.06.23.
//

import SwiftUI
import PeakSwift

struct AlgorithmSelectionView: View {
    
    @State var editMode: EditMode = .active
        
    @ObservedObject var voltageViewModel: VoltageViewModel
    
    let algorithms: [Algorithms] = [.nabian2018 , .christov,
        //.GQRS, - not implemented
                                    .basic, .wqrs, .aristotle, .neurokit]
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(selection: $voltageViewModel.selectedAlgorithms) {
                    ForEach(algorithms) { algorithm in
                        Text(algorithm.description)
                    }
                }.navigationTitle("Algorithms \(voltageViewModel.selectedAlgorithms.count) selected")
                    .environment(\.editMode, $editMode)
            }
        }
    }
}
