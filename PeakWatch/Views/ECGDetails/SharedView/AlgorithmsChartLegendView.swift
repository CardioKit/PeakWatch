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
                        .foregroundColor(symbol.color)
                        .frame(width: 8, height: 8)
                    Text(symbol.description)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
        }
    }
}
