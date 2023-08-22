//
//  ECGExportDTOHelper.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 01.08.23.
//

import Foundation
import SwiftUI

struct ECGExportDTOHelper<ExportDTO: FileExportable> {
    
    static var jsonEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
    
    static func convertToJSON(ecgExportDTO: ExportDTO) throws -> Data {
        let encodedData = try jsonEncoder.encode(ecgExportDTO)
        return encodedData
    }
    
    static func export(exportable: ExportDTO) throws -> SentTransferredFile {
        let jsonData = try ECGExportDTOHelper.convertToJSON(ecgExportDTO: exportable)
        let fileName = exportable.createFileName
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(fileName, conformingTo: .json)
        try jsonData.write(to: fileURL)
        
        return SentTransferredFile(fileURL)
    }
}



