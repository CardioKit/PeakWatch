//
//  ECGDetailView.swift
//  PeakWatch
//
//  Created by x on 09.06.23.
//

import SwiftUI
import HealthKit

struct ECGDetailView: View {
    
    let ecgSample: HKElectrocardiogram
    
    var body: some View {
        Text(ecgSample.device?.description ?? "Unknown")
    }
}

