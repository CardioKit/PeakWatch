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
    
    @ObservedObject var algorithmViewModel: AlgorithmViewModel
    
    var body: some View {
        ECGChartView(chartRange: algorithmViewModel.voltageMeasurements.count, samplingRate: self.algorithmViewModel.samplingRateValue) {
            ForEach(algorithmViewModel.voltageMeasurementsWithPeaks) {
                (voltageMeasurement) in
                LineMark(
                    x: .value("Sample", voltageMeasurement.position), y: .value("Voltage", voltageMeasurement.voltage))
                    .foregroundStyle(.red)
                ForEach(voltageMeasurement.isRPeakByAlgorithm, id: \.self) { (algorithm:Algorithms) in
                    PointMark(
                        x: .value("R peak position", voltageMeasurement.position),
                              y: .value("Voltage", voltageMeasurement.voltage))
                    .foregroundStyle(algorithm.color)
                }
            }
        } legend: {
            AlgorithmsChartLegendView(algortihms: Array(algorithmViewModel.selectedAlgorithms))
        }
       }
    
}
