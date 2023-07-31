//
//  ECGDetailView.swift
//  PeakWatch
//
//  Created by x on 09.06.23.
//

import SwiftUI
import HealthKit
import PeakSwift

struct ECGDetailView: View {
    
    let ecgSample: ECGSample
    @StateObject var algorithmViewModel: AlgorithmViewModel
    
    @State private var showingEditAlgorithm: Bool = false
    
    init(ecgSample: ECGSample) {
        self.ecgSample = ecgSample
        self._algorithmViewModel = StateObject(wrappedValue: AlgorithmViewModel(ecgSample: ecgSample))
    }

    var body: some View {
        VStack {
            if(algorithmViewModel.voltagesAllFetched) {
                List {
                    Section(header: Text("Algorithms performed")) {
                        ECGAlgorithmSectionView(voltageViewModel: algorithmViewModel, showingEditAlgorithm: $showingEditAlgorithm)
                    }
                    .headerProminence(.increased)
                    Section(header: Text("ECG Signal with R peaks")) {
                        ECGSignalView(algorithmViewModel: algorithmViewModel)
                    }.headerProminence(.increased)
                    Section(header: Text("ECG Algorithm performance")) {
                        ECGAlgorithmPerformanceView(algorithmViewModel: algorithmViewModel)
                    }.headerProminence(.increased)
                    Section(header: Text("Algorithm view execution details")) {
                        ECGSingleAlgorithmSelectionView(algorithmViewModel: algorithmViewModel)
                    }.headerProminence(.increased)
                }
                .listStyle(.insetGrouped)
            }
        }
        .navigationTitle("ECG Signal")
        .toolbar {
            ExportButtonView(algorithmViewModel: algorithmViewModel)
        }
        .task {
            await fetchVolatgesOnload()
        }.sheet(isPresented: $showingEditAlgorithm) {
            ECGAlgorithmSheetView(algorithmViewModel: algorithmViewModel)
        }
    }
    
    func fetchVolatgesOnload() async {
        if !algorithmViewModel.voltagesAllFetched {
             await algorithmViewModel.fetchVoltages()
        }
    }
}

