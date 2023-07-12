//
//  ECGRowView.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import SwiftUI

struct ECGRowView: View {
    
    let ecg: ECGSample
    
    var beatsPerMinuteLabel: String {
        if let beatsPerMinute = ecg.beatsPerMinute {
            return String(format: "%.f", beatsPerMinute)
        } else {
            return "Unknown"
        }
    }
    
    var body: some View {
            VStack {
                HStack() {
                    Text(ecg.classification.description).bold()
                    Spacer()
                    Text(DateUtils.formatDate(date: ecg.startDate))
                }.modifier(SecondaryInfoListRowViewModifier()).padding(.bottom, 5)
                HStack() {
                    Image(systemName: "heart.fill").foregroundColor(.red)
                    Text("\(beatsPerMinuteLabel)  BPM").foregroundColor(.secondary)
                    Spacer()
                    Text(ecg.ecgSource.rawValue).foregroundColor(.secondary)
                }.modifier(SecondaryInfoListRowViewModifier()).padding(.bottom, 1)
            }
    }
}

struct ECGRowView_Previews: PreviewProvider {
    static var previews: some View {
        ECGRowView(ecg: ECGSample(numberOfVoltageMeasurements: 10, startDate: Date(), endDate: Date(), device: "Apple Watch", classification: .atrialFibrillation, beatsPerMinute: 10, ecgSource: .HealthKit))
    }
}
