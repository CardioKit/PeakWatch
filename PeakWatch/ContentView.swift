//
//  ContentView.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var ecgViewModel = ECGViewModel()
    @State var openInfoSheet = false
    
    let title = "ECG samples"
    
    var body: some View {
        NavigationView {
            ECGListView(ecgViewModel: self.ecgViewModel)
                .navigationTitle(self.title)
                .toolbar {
                    InfoButtonView(
                        ecgViewModel: self.ecgViewModel,
                        openInfoSheet: self.$openInfoSheet)
                }
                .sheet(isPresented: $openInfoSheet) {
                    HomeScreen(isSheetOpen: $openInfoSheet)
            }
        }.task {
            await ecgViewModel.getECGFromHealthStore()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
