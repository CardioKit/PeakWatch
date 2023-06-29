//
//  ECGSingleAlgorithmView.swift
//  PeakWatch
//
//  Created by x on 28.06.23.
//

import SwiftUI
import PeakSwift
import Charts

struct ECGSingleAlgorithmView: View {
    
    let qrsResult: QRSResult
    
    var body: some View {
        ScrollView(.horizontal) {
            Chart(Array(zip(qrsResult.electrocardiogram.ecg, qrsResult.cleanedElectrocardiogram.ecg).enumerated()), id: \.offset) { offset, ecg in
                 let (originalECG, cleanedECG) = ecg
                LineMark(x: .value("Sample", offset), y: .value("Voltage", originalECG), series: .value("origianl", "A"))
                    .foregroundStyle(.red)
                LineMark(x: .value("SampleCleaned", offset), y: .value("VoltageCleaned", cleanedECG), series: .value("cleaned", "B"))
                    .foregroundStyle(.blue)
            }
            .chartXScale(domain: 0...qrsResult.electrocardiogram.ecg.count)
            .frame(width: CGFloat(qrsResult.electrocardiogram.ecg.count) * 0.5, height: 300)
        }
//        ScrollView(.horizontal) {
//            Chart(Array(zip(qrsResult.electrocardiogram.ecg, qrsResult.cleanedElectrocardiogram.ecg).enumerated()), id: \.offset) { offset, ecg in
//                 let (originalECG, cleanedECG) = ecg
//                LineMark(x: .value("Sample", offset), y: .value("Voltage", originalECG))
//                    .foregroundStyle(.red)
//                LineMark(x: .value("Sample", offset), y: .value("VoltageCleaned", cleanedECG))
//                    .foregroundStyle(.red)
//            }
//            .chartXScale(domain: 0...qrsResult.electrocardiogram.ecg.count)
//            .frame(width: CGFloat(qrsResult.electrocardiogram.ecg.count) * 0.5, height: 300)
//        }
    }
}

