//
//  AlgorithmsChartLegendView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import Foundation
import SwiftUI
import Charts
import PeakSwift


struct AlgorithmsChartLegendView: View {
    
    let algortihms: [Algorithms]
    
    var body: some View {
        HStack {
            ForEach(algortihms, id: \.self) { symbol in
                HStack {
                    BasicChartSymbolShape.circle
                        .foregroundColor(colorFor(symbol: symbol))
                        .frame(width: 8, height: 8)
                    Text(symbol.description)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
        }
    }
    
    let colors = [Color.blue, .green, .orange, .purple, .red, .cyan, .yellow]

    func colorFor(symbol: Algorithms) -> Color {
        let symbolIndex = supportedAlgorithms.firstIndex(of: symbol) ?? 0
        return colors[symbolIndex % colors.count]
    }
}
