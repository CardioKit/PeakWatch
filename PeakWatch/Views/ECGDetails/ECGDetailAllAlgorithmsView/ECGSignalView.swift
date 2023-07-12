//
//  ECGSignalView.swift
//  PeakWatch
//
//  Created by x on 12.06.23.
//

import SwiftUI
import Charts
import PeakSwift

struct ECGSignalView: View {
    
    @ObservedObject var voltageViewModel: VoltageViewModel
    
    var body: some View {
        ECGChartView(chartRange: voltageViewModel.voltageMeasurements.count, samplingRate: self.voltageViewModel.samplingRateValue) {
            ForEach(voltageViewModel.voltageMeasurements) {
                (voltageMeasurement) in
                LineMark(
                    x: .value("Sample", voltageMeasurement.position), y: .value("Voltage", voltageMeasurement.voltage))
                    .foregroundStyle(.red)
                ForEach(voltageMeasurement.isRPeakByAlgorithm, id: \.self) { (algorithm:Algorithms) in
                    PointMark(
                        x: .value("R peak position", voltageMeasurement.position),
                              y: .value("Voltage", voltageMeasurement.voltage))
                    .foregroundStyle(by: .value("Algorithm", algorithm.description))
                }
            }
        }
       }
    
}
