//
//  LegendContainerItemView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import SwiftUI
import PeakSwift
import Charts

struct LegendContainerItemView: ContainerItemView {
    
    let item: Algorithms
    
    var body: some View {
        HStack {
            BasicChartSymbolShape.circle
                .foregroundColor(item.color)
                .frame(width: 8, height: 8)
            Text(item.description)
                .foregroundColor(.gray)
                .font(.caption)
        }
    }
}
