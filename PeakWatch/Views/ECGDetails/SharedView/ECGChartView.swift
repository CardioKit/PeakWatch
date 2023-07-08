//
//  ECGChartView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 07.07.23.
//

import SwiftUI
import Charts

struct ECGChartView<Content: ChartContent>: View {
    
    let chartRange:Int
    @ChartContentBuilder var content: Content
    
    var body: some View {
        ScrollView(.horizontal) {
            Chart {
                content
            }.chartXScale(domain: 0...chartRange)
            .frame(width: CGFloat(chartRange) * 0.5, height: 300)
            .chartLegend(.visible)
        }
    }
}

