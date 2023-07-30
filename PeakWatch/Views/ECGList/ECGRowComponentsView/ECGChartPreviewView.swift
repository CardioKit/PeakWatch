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
    
    @StateObject var voltageViewModel: VoltageViewModel
    
    init(ecg: ECGSample) {
        self.ecg = ecg
        self._voltageViewModel = StateObject(wrappedValue: VoltageViewModel(ecgSample: ecg))
    }

    
    var body: some View {
        return VStack() {
            if voltageViewModel.voltagesAllFetched {
                VStack {
                    ECGChartView(chartRange: voltageViewModel.voltageMeasurements.count, samplingRate: samplinRate, widthScaling: 0.2, height: 150, scrollable: false, showXAxisIntermediateMarker: false, showYAxisMarker: false, showXAxisValueLabels: false, oneSecondLinesColor: .gray.opacity(0.25)) {
                        ForEach(voltageViewModel.voltageMeasurements) {
                            (voltageMeasurement) in
                            LineMark(
                                x: .value("Sample", voltageMeasurement.position), y: .value("Voltage", voltageMeasurement.voltage))
                            .foregroundStyle(.red)
                        }
                    }
                }
                .cornerRadius(10) /// make the background rounded
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray)
                    )
            } else {
                EmptyView()
            }
        }
        .frame(minHeight: 150)
        .task {
           await fetchVoltagesOnLoad()
        }
    }
    
    func fetchVoltagesOnLoad() async {
        guard !voltageViewModel.voltagesAllFetched else {
            return
        }
        
        let maxSamples3s = Int(samplinRate * 3.0)
        await voltageViewModel.fetchVoltages(maxSamples: maxSamples3s)
    }
}
