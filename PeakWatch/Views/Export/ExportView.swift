//
//  SwiftUIView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 06.08.23.
//

import SwiftUI

struct ExportView: View {
    
    @StateObject var exportViewModel: ExportViewModel
    
    init(ecgs: [ECGSample]) {
        self._exportViewModel = StateObject(wrappedValue: ExportViewModel(ecgs: ecgs))
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
