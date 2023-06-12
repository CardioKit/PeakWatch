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
}
