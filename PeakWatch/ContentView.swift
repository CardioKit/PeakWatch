//
//  ContentView.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import SwiftUI

struct ContentView: View {
    
    let title = "ECG Samples"
    
    var body: some View {
        NavigationView{
            ECGListView()
                .navigationTitle(title)
                .toolbar {
                    SettingsButton()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
