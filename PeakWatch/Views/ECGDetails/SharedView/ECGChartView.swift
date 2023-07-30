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
    let widthScaling: Double
    let height: Double
    let scrollable: Bool
    let showXAxisIntermediateMarker: Bool
    let showYAxisMarker: Bool
    let showXAxisValueLabels: Bool
    let oneSecondLinesColor: Color
    
    @ChartContentBuilder var content: Content
    
    init(chartRange: Int, samplingRate: Double, widthScaling: Double = 0.5, height: Double = 300, scrollable: Bool = true, showXAxisIntermediateMarker: Bool = true, showYAxisMarker: Bool = true, showXAxisValueLabels: Bool = true, oneSecondLinesColor: Color = .gray, @ChartContentBuilder content: () -> Content) {
        self.chartRange = chartRange
        self.samplingRate = samplingRate
        self.widthScaling = widthScaling
        self.height = height
        self.scrollable = scrollable
        self.showXAxisIntermediateMarker = showXAxisIntermediateMarker
        self.showYAxisMarker = showYAxisMarker
        self.showXAxisValueLabels = showXAxisValueLabels
        self.oneSecondLinesColor = oneSecondLinesColor
        self.content = content()
    }
    
    var body: some View {
        if scrollable {
            ScrollView(.horizontal, showsIndicators: false) {
                chart
            }
        } else {
                chart
        }
    }
    
    var chart: some View {
        Chart {
            content
        }
        .chartXScale(domain: 0...chartRange)
        .frame(width: CGFloat(chartRange) * CGFloat(widthScaling), height: CGFloat(height))
        .chartLegend(.visible)
        .chartXAxis {
            self.xAxisMarks
        }
        .chartYAxis {
            if showYAxisMarker {
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
                    if showXAxisValueLabels {
                        AxisValueLabel() {
                            let seconds = String(format: "%.0f", doubleValue/samplingRate)
                            Text("\(seconds)s")
                        }
                    }
                    AxisGridLine(stroke: .init(lineWidth: 1))
                        .foregroundStyle(self.oneSecondLinesColor)
                } else {
                    // Light line
                    if showXAxisIntermediateMarker {
                        AxisGridLine(stroke: .init(lineWidth: 1))
                            .foregroundStyle(.gray.opacity(0.25))
                    }
                }
            }
        }
    }
}

