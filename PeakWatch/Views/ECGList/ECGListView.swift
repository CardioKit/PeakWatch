//
//  ECGList.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import Foundation
import SwiftUI

struct ECGListView: View {
    
    @ObservedObject var ecgViewModel: ECGViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 20) {
                ForEach(ecgViewModel.ecgs) { (ecg)  in
                    NavigationLink(destination: ECGDetailView(ecgSample: ecg)) {
                        ECGRowView(ecg: ecg)
                    }.buttonStyle(PlainButtonStyle())
                }
                
            }
            .padding([.leading, .trailing],20)
        }.background(Colors.background.value)
    }
    
}

