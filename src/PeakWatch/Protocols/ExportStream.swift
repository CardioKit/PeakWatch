//
//  ExportStream.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 14.11.23.
//

import Foundation

protocol ExportStream {
    
    
    func exportECG(ecgExport: ECGExportDTO) throws
    
    func getExportFile() -> URL
}
