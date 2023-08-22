//
//  DurationExtension.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 29.07.23.
//

import Foundation

extension Duration {
    
    var inMilliseconds: Double {
           return Double(components.seconds) * 1000 + Double(components.attoseconds) * 1e-15
       }
}
