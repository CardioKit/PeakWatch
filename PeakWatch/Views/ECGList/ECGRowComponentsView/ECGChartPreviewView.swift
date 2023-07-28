//
//  ECGChartPreview.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 27.07.23.
//

import SwiftUI
import Charts
import HealthKit

struct ECGChartPreviewView: View {
    
    let samplinRate = 512.0
    let ecg: ECGSample
    
    @StateObject var voltageViewModel: OnlyVoltageViewModel
    
    init(ecg: ECGSample) {
        self.ecg = ecg
        self._voltageViewModel = StateObject(wrappedValue: OnlyVoltageViewModel(ecgSample: ecg))
    }

    
    var body: some View {
        return VStack() {
            if voltageViewModel.voltagesAllFetched {
                VStack {
                    ECGChartView(chartRange: voltageViewModel.voltageMeasurements.count, samplingRate: samplinRate, widthScaling: 0.2, height: 150, scrollable: false) {
                        ForEach(voltageViewModel.voltageMeasurements) {
                            (voltageMeasurement) in
                            LineMark(
                                x: .value("Sample", voltageMeasurement.position), y: .value("Voltage", voltageMeasurement.voltage))
                            .foregroundStyle(.red)
                        }
                    }
                }
            } else {
                EmptyView()
            }
        }
        .frame(minHeight: 150).task {
            guard !voltageViewModel.voltagesAllFetched else {
                return
            }
            
            let maxSamples3s = Int(samplinRate * 3.0)
            await voltageViewModel.fetchVoltages(maxSamples: maxSamples3s)
            
        }
    }
}
