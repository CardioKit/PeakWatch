//
//  ECGAlgorithmPerformance.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 29.07.23.
//

import SwiftUI
import Charts

struct ECGAlgorithmPerformanceView: View {
    
    @ObservedObject var algorithmViewModel: AlgorithmViewModel
    
    let barWidth: Double = 30.0
    let spacing: Double = 40.0
    
    var chartHeight: CGFloat {
        CGFloat((barWidth + spacing) * Double(algorithmViewModel.qrsResultsByAlgorithm.count))
    }
    
    
    var body: some View {
        VStack {
            Chart {
                ForEach(Array(self.algorithmViewModel.qrsResultsByAlgorithm), id: \.algorithm) { qrsResults in
                    BarMark(
                        x: .value("Duration", qrsResults.duration.inMilliseconds),
                        y: .value("Algorithm", qrsResults.algorithm.description),
                        width: MarkDimension(floatLiteral: barWidth)
                    )
                }
            }
        }.frame(height: chartHeight)
    }
}
