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
    
    #warning("recator copy and paste")
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(exportedContentType: .json) { ecgExport in
            let jsonData = try ECGExportDTOHelper.convertToJSON(ecgExportDTO: ecgExport)
            let fileName = ECGExportDTOHelper.createFileName(ecgExportDTO: ecgExport)
            let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(fileName, conformingTo: .json)
            try jsonData.write(to: fileURL)
            
            return SentTransferredFile(fileURL)
        }
    }
    
}
