//
//  ContentView.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var ecgViewModel = ECGViewModel()
    @StateObject var infoSheetViewModel = InfoSheetViewModel()
    
    let title = "ECG samples"
    
    var body: some View {
        NavigationView {
            ECGListView(ecgViewModel: self.ecgViewModel)
                .navigationTitle(self.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarView(ecgs: ecgViewModel.ecgs, openInfoSheet: $infoSheetViewModel.openInfoSheet)
                }
                .sheet(isPresented: $infoSheetViewModel.openInfoSheet) {
                    HomeScreen(isSheetOpen: $infoSheetViewModel.openInfoSheet)
            }
        }.task {
            await ecgViewModel.getECGFromHealthStore()
            infoSheetViewModel.shouldOpenInfoSheet()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
