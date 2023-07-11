//
//  ECGNavigationView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct ECGNavigationView: View {
    
    @StateObject var ecgViewModel: ECGViewModel = ECGViewModel()
    @Binding var isSheetOpen: Bool
    
    
    var body: some View {
        Group() {
            if !ecgViewModel.ecgs.isEmpty {
                ECGFoundView(ecgViewModel: ecgViewModel, isSheetOpen: $isSheetOpen)
            } else {
                ECGNotFoundView(ecgViewModel: ecgViewModel)
            }
        }.task {
            await ecgViewModel.getECGFromHealthStore()
        }
    }
}

