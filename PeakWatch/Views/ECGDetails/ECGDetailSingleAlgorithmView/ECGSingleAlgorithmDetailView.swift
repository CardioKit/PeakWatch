//
//  ECGSingleAlgorithmDetailView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI
import PeakSwift

struct ECGSingleAlgorithmDetailView: View {
    
    let qrsResult: QRSResult
    let algorithm: Algorithms
    
    
    var body: some View {
        List {
            Section(header: Text("ECG Signal")) {
                ECGSingleAlgorithmChartView(qrsResult: qrsResult)
            }
            .navigationTitle(algorithm.description)
            .headerProminence(.increased)
        }
    }
}
