//
//  ECGQualityListView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import SwiftUI

struct ECGQualityListView: View {
    
    let ecgQualities: [ECGQuality]
    
    var body: some View {
        ForEach(ecgQualities) { quality in
            ECGQualityRowView(ecgQuality: quality)
        }
    }

}
