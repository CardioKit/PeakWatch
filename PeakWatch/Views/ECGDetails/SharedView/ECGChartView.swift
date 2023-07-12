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
        ScrollView(.horizontal) {
            Chart {
                content
            }.chartXScale(domain: 0...chartRange)
                .frame(width: CGFloat(chartRange) * 0.5, height: 300)
            .chartLegend(.visible)
            .chartXAxis {
                AxisMarks(values: .stride(by: (self.samplingRate / 5.0))) { value in
                          if let intValue = value.as(Int.self) {
                              if intValue % Int(self.samplingRate) == 0  {
                                  AxisTick(stroke: .init(lineWidth: 1))
                                      .foregroundStyle(.gray)
                                  AxisValueLabel() {
                                      Text("\(intValue / Int(self.samplingRate))s")
                                  }
                                  AxisGridLine(stroke: .init(lineWidth: 1))
                                      .foregroundStyle(.gray)
                              } else {
                                  AxisGridLine(stroke: .init(lineWidth: 1))
                                      .foregroundStyle(.gray.opacity(0.25))
                              }
                          }
                      }
                  }
            .chartYAxis {
                  AxisMarks(values: .automatic(desiredCount: 14)) { value in
                      AxisGridLine(stroke: .init(lineWidth: 1))
                          .foregroundStyle(.gray.opacity(0.25))
                  }
              }
        }
    }
}

