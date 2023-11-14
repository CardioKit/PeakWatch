//
//  ImportStream.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 14.11.23.
//

import Foundation


protocol ImportStream {
    
    
    func getNextECG() throws -> ECGSample?
}
