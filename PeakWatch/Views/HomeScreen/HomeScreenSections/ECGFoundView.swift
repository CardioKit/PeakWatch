//
//  ECGFoundView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct ECGFoundView: View {
    
    @ObservedObject var ecgViewModel: ECGViewModel
    
    var body: some View {
        NavigationLink(destination:
                        ECGListView(ecgViewModel: self.ecgViewModel).navigationTitle("ECG Samples")) {
            Text("Try it out")
        }
    }
}
