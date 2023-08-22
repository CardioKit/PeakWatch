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
    let minHeight: Double = 100.0
    
    var chartHeight: CGFloat {
        let dynamicHeight = CGFloat((barWidth + spacing) * Double(algorithmViewModel.qrsResultsByAlgorithm.count))
        return dynamicHeight > minHeight ? dynamicHeight : minHeight
    }
    
    let barColor = Color(.red)
    
    let xAxisLabel = "Execution time in milliseconds"
    
    var body: some View {
        VStack {
            Chart {
                ForEach(Array(self.algorithmViewModel.qrsResultsByAlgorithm), id: \.algorithm) { qrsResults in
                    BarMark(
                        x: .value("Duration", qrsResults.runtime.inMilliseconds),
                        y: .value("Algorithm", qrsResults.algorithm.description),
                        width: MarkDimension(floatLiteral: barWidth)
                    )
                    .annotation(position: .trailing) {
                        ExecutionTimeLabel(duration: qrsResults.runtime)
                    }
                    .foregroundStyle(barColor)
                }
            }
        }
        .frame(height: chartHeight)
        .chartXAxisLabel(xAxisLabel)
        .chartXAxis {
            xAxisMarks
        }
    }
    
    var xAxisMarks: some AxisContent {
        AxisMarks { mark in
            let value = mark.as(Int.self)!
            AxisGridLine()
            AxisTick()
            AxisValueLabel {
                Text("\(value) ms")
            }
        }
    }
    
    struct ExecutionTimeLabel: View {
        let duration: Duration
        
        var body: some View {
            let ms = String(format: "%.2f", duration.inMilliseconds)
            return Text("\(ms) ms")
                .foregroundStyle(Color.gray)
                .font(.system(size: 12, weight: .bold))
        }
    }

}
