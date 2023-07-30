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
    
    let ecg: ECGSample
    let chartHeight = 100.0
    
    @StateObject var voltageViewModel: VoltageViewModel
    
    init(ecg: ECGSample) {
        self.ecg = ecg
        self._voltageViewModel = StateObject(wrappedValue: VoltageViewModel(ecgSample: ecg))
    }
    
    var chartRangeWithPadding: ClosedRange<Double> {
        let padding =  voltageViewModel.maxVoltage * 0.1
        let start = voltageViewModel.minVoltage - padding
        let end = voltageViewModel.maxVoltage + padding
        return start...end
    }

    
    var body: some View {
        return VStack() {
            if voltageViewModel.voltagesAllFetched {
                VStack {
                    ECGChartView(chartRange: voltageViewModel.voltageMeasurements.count, samplingRate: ecg.samplingRate, widthScaling: 0.2, height: chartHeight, scrollable: false, showXAxisIntermediateMarker: false, showYAxisMarker: false, showXAxisValueLabels: false, oneSecondLinesColor: .gray.opacity(0.25)) {
                        ForEach(voltageViewModel.voltageMeasurements) {
                            (voltageMeasurement) in
                            LineMark(
                                x: .value("Sample", voltageMeasurement.position), y: .value("Voltage", voltageMeasurement.voltage))
                            .foregroundStyle(.red)
                        }
                    }.chartYScale(domain: chartRangeWithPadding)
                }.modifier(RoundedBackgroundModifier())
            } else {
                EmptyView()
            }
        }
        .frame(minHeight: chartHeight)
        .task {
           await fetchVoltagesOnLoad()
        }
    }

    func fetchVoltagesOnLoad() async {
        guard !voltageViewModel.voltagesAllFetched else {
            return
        }
        
        let maxSamples3s = Int(ecg.samplingRate * 3.0)
        await voltageViewModel.fetchVoltages(maxSamples: maxSamples3s)
    }
}
