//
//  ECGExport.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct ECGExportDTO: Codable, Transferable {
    
    let ecg: ECGInformationDTO
    let appleMetaData: ECGAppleMetaDataDTO
    let algorithms: [RPeaksDTO]
    let signalQuality: [SignalQualityDTO]
    let deviceID: UUID
    
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(exportedContentType: .json) { ecgExport in
            let jsonData = try ECGExportDTOFactory.convertToJSON(ecgExportDTO: ecgExport)
            let fileName = ECGExportDTOFactory.createFileName(ecgExportDTO: ecgExport)
            let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(fileName, conformingTo: .json)
            try jsonData.write(to: fileURL)
            
            return SentTransferredFile(fileURL)
        }
    }
}
