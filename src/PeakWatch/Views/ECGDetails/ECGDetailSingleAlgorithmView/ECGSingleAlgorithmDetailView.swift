//
//  ECGSingleAlgorithmDetailView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI
import PeakSwift

struct ECGSingleAlgorithmDetailView: View {
    
    let qrsResult: QRSResultsByAlgorithm
    let algorithm: Algorithms
    
    let ecgSignalSection = "ECG Signal"
    let performanceSection = "Performance"
    
    
    var body: some View {
        List {
            Section(header: Text(ecgSignalSection)) {
                ECGSingleAlgorithmChartView(qrsResult: qrsResult.qrsResult)
            }.headerProminence(.increased)
            Section(header: Text(performanceSection)) {
                ECGSingleAlgorithmPerformanceView(executionTime: qrsResult.runtime)
            }.headerProminence(.increased)
            .navigationTitle(algorithm.rawValue)
        }
    }
}
