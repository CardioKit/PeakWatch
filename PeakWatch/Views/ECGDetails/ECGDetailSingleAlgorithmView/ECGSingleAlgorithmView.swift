//
//  ECGSingleAlgorithmView.swift
//  PeakWatch
//
//  Created by x on 28.06.23.
//

import SwiftUI
import PeakSwift
import Charts

struct ECGSingleAlgorithmView: View {
    
    let qrsResult: QRSResult
    let algorithm: Algorithms
    
    var body: some View {
            ECGChartView(chartRange: qrsResult.electrocardiogram.ecg.count) {
                ForEach(Array(zip(qrsResult.electrocardiogram.ecg, qrsResult.cleanedElectrocardiogram.ecg).enumerated()), id: \.offset) { offset, ecg in
                    let (originalECG, cleanedECG) = ecg
                    
                    LineMark(x: .value("Sample", offset),
                             y: .value("Voltage", originalECG),
                             series: .value("original", "A"))
                    .foregroundStyle(by:.value("Signal", "Original Signal"))
                    
                    LineMark(x: .value("SampleCleaned", offset),
                             y: .value("VoltageCleaned", cleanedECG),
                             series: .value("cleaned", "B"))
                    .foregroundStyle(by: .value("Signal", "Clean Signal"))
                    
                    if qrsResult.rPeaks.contains(UInt(offset)) {
                        PointMark(x: .value("R peak position", offset),
                                  y: .value("Voltage", cleanedECG))
                        .foregroundStyle(by: .value("Signal", "Peaks"))
                    }
                }
            }
            .chartForegroundStyleScale(range: [.red, .blue, .green])
            .navigationTitle(algorithm.description)
    }
}

