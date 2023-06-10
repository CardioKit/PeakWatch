//
//  ECGDetailView.swift
//  PeakWatch
//
//  Created by x on 09.06.23.
//

import SwiftUI
import HealthKit
import Charts

struct ECGDetailView: View {
    
    let ecgSample: HKElectrocardiogram
    @StateObject var voltageViewModel: VoltageViewModel
    
    init(ecgSample: HKElectrocardiogram) {
        self.ecgSample = ecgSample
        self._voltageViewModel = StateObject(wrappedValue: VoltageViewModel(ecgSample: ecgSample))
    }
    
    var body: some View {
        VStack {
            if(voltageViewModel.voltagesAllFetched) {
                ScrollView(.horizontal) {
                    Chart(voltageViewModel.voltageMeasurements) { (voltageMeasurement) in
                        LineMark(x: .value("Sample", voltageMeasurement.position), y: .value("Voltage", voltageMeasurement.voltage))
                    }.frame(width: CGFloat(voltageViewModel.voltageMeasurements.count) * 0.5, height: 300)
                }
                
            }
        }.navigationTitle("ECG Signal")
            .task {
            voltageViewModel.fetchVoltages()
        }
    }
}

