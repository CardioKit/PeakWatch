//
//  ECGRowView.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import SwiftUI

struct ECGRowView: View {
    
    let ecg: ECGSample
    
    var body: some View {
            VStack {
                HStack() {
                    Text(String(ecg.device)).bold()
                    Spacer()
                    Text(DateUtils.formatDate(date: ecg.startDate))
                }.modifier(SecondaryInfoListRowViewModifier()).padding(.bottom, 5)
                HStack() {
                    Text("Voltage measurements: \(ecg.numberOfVoltageMeasurements)").foregroundColor(.secondary)
                }.modifier(SecondaryInfoListRowViewModifier())
                HStack() {
                    Text("Symptoms: \(ecg.classification.description)").foregroundColor(.secondary)
                }.modifier(SecondaryInfoListRowViewModifier())
            }
    }
}

struct ECGRowView_Previews: PreviewProvider {
    static var previews: some View {
        ECGRowView(ecg: ECGSample(numberOfVoltageMeasurements: 10, startDate: Date(), endDate: Date(), device: "Apple Watch", classification: .atrialFibrillation))
    }
}
