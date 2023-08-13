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
    
    let algorithmsSelectionTitle = "Configure algorithms"
    let chartTitle = "ECG Signal with R peaks"
    let performanceTitle = "ECG Algorithm performance"
    let singleAlgortihmTitle = "Algorithm view execution details"
    let ecgQualityTitle = "ECG Quality"

    var body: some View {
        VStack {
            if(algorithmViewModel.voltagesAllFetched) {
                List {
                    Section(header: Text(algorithmsSelectionTitle)) {
                        ECGAlgorithmSectionView(voltageViewModel: algorithmViewModel, showingEditAlgorithm: $showingEditAlgorithm)
                    }
                    .headerProminence(.increased)
                    Section(header: Text(chartTitle)) {
                        ECGSignalView(algorithmViewModel: algorithmViewModel)
                    }.listRowSeparator(.hidden).headerProminence(.increased)
                    Section(header: Text(performanceTitle)) {
                        ECGAlgorithmPerformanceView(algorithmViewModel: algorithmViewModel)
                    }.headerProminence(.increased)
                    Section(header: Text(singleAlgortihmTitle)) {
                        ECGSingleAlgorithmSelectionView(algorithmViewModel: algorithmViewModel)
                    }.headerProminence(.increased)
                    Section(header: Text(ecgQualityTitle)) {
                        ECGQualityListView(ecgQualities: algorithmViewModel.ecgQualityByAlgortihm)
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

