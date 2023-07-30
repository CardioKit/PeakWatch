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
                }.background(Color("CardHeader"))
                //.background(Color.gray.opacity(0.1))
                ECGChartPreviewView(ecg: ecg)
                    .padding(10)
            }
        }.shadow(radius: 2)
    }
}
