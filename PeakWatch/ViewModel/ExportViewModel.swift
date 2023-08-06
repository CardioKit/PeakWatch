//
//  ExportViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 06.08.23.
//

import Foundation

class ExportViewModel: ObservableObject {
    
    let ecgs: [ECGSample]
    
    init(ecgs: [ECGSample]) {
        self.ecgs = ecgs
    }
}
