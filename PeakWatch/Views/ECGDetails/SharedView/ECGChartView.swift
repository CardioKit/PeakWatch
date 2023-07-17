//
//  ECGChartView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 07.07.23.
//

import SwiftUI
import Charts

struct ECGChartView<Content: ChartContent>: View {
    
    
    let chartRange: Int
    let samplingRate: Double
    @ChartContentBuilder var content: Content
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Chart {
                content
            }
            .chartXScale(domain: 0...chartRange)
            .frame(width: CGFloat(chartRange) * 0.5, height: 300)
            .chartLegend(.visible)
            .chartXAxis {
                self.xAxisMarks
            }
            .chartYAxis {
                self.yAxisMarks
            }
        }
    }
    
    var yAxisMarks: some AxisContent {
        AxisMarks(values: .automatic(desiredCount: 14)) { value in
            AxisGridLine(stroke: .init(lineWidth: 1))
                .foregroundStyle(.gray.opacity(0.25))
        }
    }
    
    var xAxisMarks: some AxisContent {
        
        // The samping rate is the amount of samples per second
        // We need five lines per second
        // Each 5th line is a second and we mark the 5th
        let intervalMs200 = self.samplingRate / 5.0
        
        return AxisMarks(values: .stride(by: (intervalMs200))) { value in
            if let doubleValue = value.as(Double.self) {
                if doubleValue.truncatingRemainder(dividingBy: samplingRate) == 0  {
                    // Thick line
                    AxisTick(stroke: .init(lineWidth: 1))
                        .foregroundStyle(.gray)
                    AxisValueLabel() {
                        let seconds = String(format: "%.0f", doubleValue/samplingRate)
                        Text("\(seconds)s")
                    }
                    AxisGridLine(stroke: .init(lineWidth: 1))
                        .foregroundStyle(.gray)
                } else {
                    // Light line
                    AxisGridLine(stroke: .init(lineWidth: 1))
                        .foregroundStyle(.gray.opacity(0.25))
                }
            }
        }
    }
}

