//
//  ECGChartPreview.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 27.07.23.
//

import SwiftUI
import Charts
import HealthKit

struct ECGPreviewView: View {
    
    let ecgSample: HKElectrocardiogram
    let samplinRate = 512.0
    let ecg: ECGSample
    
    @StateObject var voltageViewModel: OnlyVoltageViewModel
    
    init(ecgSample: HKElectrocardiogram, ecg: ECGSample) {
        self.ecgSample = ecgSample
        self.ecg = ecg
        self._voltageViewModel = StateObject(wrappedValue: OnlyVoltageViewModel(ecgSample: ecgSample))
    }

    
    var body: some View {
        print("Load row")
        return VStack() {
            if voltageViewModel.voltagesAllFetched {
                VStack {
                    ECGChartView(chartRange: voltageViewModel.voltageMeasurements.count, samplingRate: samplinRate, widthScaling: 0.2, height: 150, scrollable: false) {
                        ForEach(voltageViewModel.voltageMeasurements) {
                            (voltageMeasurement) in
                            LineMark(
                                x: .value("Sample", voltageMeasurement.position), y: .value("Voltage", voltageMeasurement.voltage))
                            .foregroundStyle(.red)
                        }
                    }
                }
            } else {
                EmptyView()
            }
        }
        .frame(minHeight: 150).task {
            guard !voltageViewModel.voltagesAllFetched else {
                return
            }
            print("fetching \(ecgSample.uuid)")
            
            
            await voltageViewModel.fetchVoltages(amountOfSample: Int(samplinRate * 3.0))
            
        }
//        ECGChartView(chartRange: voltageViewModel.voltageMeasurements.count, samplingRate: self.voltageViewModel.samplingRateValue) {
////            ForEach(voltageViewModel.voltageMeasurements) {
////                (voltageMeasurement) in
////                LineMark(
////                    x: .value("Sample", voltageMeasurement.position), y: .value("Voltage", voltageMeasurement.voltage))
////                    .foregroundStyle(.red)
////            }
//        }.task {
//            //voltageViewModel.fetchVoltages()
//        }
        Text("test")
    }
}
