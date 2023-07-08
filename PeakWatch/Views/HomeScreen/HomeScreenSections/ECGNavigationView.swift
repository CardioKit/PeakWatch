//
//  ECGNavigationView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct ECGNavigationView: View {
    var body: some View {
        NavigationLink(destination:
                        ECGListView().navigationTitle("ECG Samples")) {
            Text("Try it out")
        }
    }
}

