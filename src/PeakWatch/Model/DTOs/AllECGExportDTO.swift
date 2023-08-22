//
//  AllECGExport.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 07.08.23.
//

import Foundation
import SwiftUI

struct AllECGExportDTO: Codable {
    
    var ecgs: [ECGExportDTO]
    
}

extension AllECGExportDTO: Transferable {
    
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(exportedContentType: .json) { ecgExport in
            return try ECGExportDTOHelper.export(exportable: ecgExport)
        }
    }
    
}
