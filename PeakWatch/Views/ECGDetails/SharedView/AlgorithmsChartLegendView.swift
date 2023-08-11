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
        ContainerView<LegendContainerItemView>(items: algortihms)
    }
}
