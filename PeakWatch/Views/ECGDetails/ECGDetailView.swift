//
//  ECGDetailView.swift
//  PeakWatch
//
//  Created by x on 09.06.23.
//

import SwiftUI
import HealthKit

struct ECGDetailView: View {
    
    let ecgSample: HKElectrocardiogram
    @StateObject var voltageViewModel: VoltageViewModel
    
    @State private var showingEditAlgorithm: Bool = false
    
    init(ecgSample: HKElectrocardiogram) {
        self.ecgSample = ecgSample
        self._voltageViewModel = StateObject(wrappedValue: VoltageViewModel(ecgSample: ecgSample))
    }
    
    var body: some View {
        VStack {
            if(voltageViewModel.voltagesAllFetched) {
                
                List {
                    Section(header: Text("Algorithms performed")) {
                        ECGAlgorithmSectionView(voltageViewModel: voltageViewModel, showingEditAlgorithm: $showingEditAlgorithm)
                    }
                    .headerProminence(.increased)
                    Section(header: Text("ECG Signal with R peaks")) {
                        ECGSignalView(voltageViewModel: voltageViewModel)
                    }.headerProminence(.increased)
                }
                .listStyle(.insetGrouped)
            }
        }.navigationTitle("ECG Signal")
            .task {
            voltageViewModel.fetchVoltages()
            }.sheet(isPresented: $showingEditAlgorithm) {
                AlgorithmSelectionView(voltageViewModel: self.voltageViewModel)
            }
    }
}

