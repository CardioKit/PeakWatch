//
//  ECGDetailView.swift
//  PeakWatch
//
//  Created by x on 09.06.23.
//

import SwiftUI
import HealthKit
import Charts
import PeakSwift

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
                Button("Select Algorithms") {
                    showingEditAlgorithm.toggle()
                }
                ScrollView(.horizontal) {
                    Chart(voltageViewModel.voltageMeasurements) { (voltageMeasurement) in
                        LineMark(x: .value("Sample", voltageMeasurement.position), y: .value("Voltage", voltageMeasurement.voltage))
                            .foregroundStyle(.red)
                        ForEach(voltageMeasurement.isRPeakByAlgorithm, id: \.self) { (algorithm:Algorithms) in
                            PointMark(x: .value("R peak position", voltageMeasurement.position),
                                      y: .value("Voltage", voltageMeasurement.voltage))
                            .foregroundStyle(by: .value("Algorithm", algorithm.description))
                        }
                    }
                    .chartXScale(domain: 0...voltageViewModel.voltageMeasurements.count)
                    .frame(width: CGFloat(voltageViewModel.voltageMeasurements.count) * 0.5, height: 300)
                }
            }
        }.navigationTitle("ECG Signal")
            .task {
            voltageViewModel.fetchVoltages()
            }.sheet(isPresented: $showingEditAlgorithm) {
                AlgorithmSelectionView(voltageViewModel: self.voltageViewModel)
            }
    }
}

