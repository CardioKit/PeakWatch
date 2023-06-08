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
            List(ecgViewModel.ecgs, id: \.id) { ecg in
                ECGRowView(ecg: ecg)
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
