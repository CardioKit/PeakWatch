//
//  ECGList.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import Foundation
import SwiftUI

struct ECGListView: View {
    
    @StateObject var ecgViewModel: ECGViewModel = ECGViewModel()
    
 
    var body: some View {
        VStack {
            List(ecgViewModel.ecgsAndHkElectrocardiogram, id: \.0.id) { (ecg,hkElectrocardiogram)  in
                NavigationLink(destination: ECGDetailView(ecgSample: hkElectrocardiogram)) {
                     ECGRowView(ecg: ecg)
                }
            }.task {
                await ecgViewModel.getECGFromHealthStore()
            }
        }
    
    }
}


struct ECGListView_Previews: PreviewProvider {
    static var previews: some View {
        ECGListView()
    }
}
