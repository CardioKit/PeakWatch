//
//  ContentView.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            HomeScreen()
            //ECGListView().navigationTitle("ECG Samples")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
