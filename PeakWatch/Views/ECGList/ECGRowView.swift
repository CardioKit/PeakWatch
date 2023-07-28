//
//  ECGRowView.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import SwiftUI
import HealthKit

struct ECGRowView: View {
    
    let ecg: ECGSample
    let hkECG: HKElectrocardiogram
    
    var body: some View {
        CardView(padding: 0, cornerRadius: 8) {
            VStack {
                VStack {
                    VStack {
                        ECGRowHeader(ecg: ecg)
                            .modifier(SecondaryInfoListRowViewModifier())
                            .padding(.bottom, 5)
                        ECGRowDetailsView(ecg: ecg)
                            .modifier(SecondaryInfoListRowViewModifier()).padding(.bottom, 1)
                    }.padding(10)
                }.background(.quaternary)
                ECGChartPreviewView(ecgSample: hkECG, ecg: ecg).padding(10)
            }
        }
    }
}
//
//struct ECGRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ECGRowView(ecg: ECGSample(numberOfVoltageMeasurements: 10, startDate: Date(), endDate: Date(), device: "Apple Watch", classification: .atrialFibrillation, beatsPerMinute: 10, ecgSource: .HealthKit))
//    }
//}
