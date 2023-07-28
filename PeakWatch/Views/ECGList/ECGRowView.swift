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
            VStack {
                ECGRowHeader(ecg: ecg)
                    .modifier(SecondaryInfoListRowViewModifier())
                    .padding(.bottom, 5)
                ECGRowDetailsView(ecg: ecg)
                    .modifier(SecondaryInfoListRowViewModifier()).padding(.bottom, 1)
                ECGChartPreviewView(ecgSample: hkECG, ecg: ecg)
            }
    }
}
//
//struct ECGRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ECGRowView(ecg: ECGSample(numberOfVoltageMeasurements: 10, startDate: Date(), endDate: Date(), device: "Apple Watch", classification: .atrialFibrillation, beatsPerMinute: 10, ecgSource: .HealthKit))
//    }
//}
