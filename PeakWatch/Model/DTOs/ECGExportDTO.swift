//
//  ECGExport.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation
import SwiftUI

struct ECGExportDTO: Codable, Transferable {
    
    let ecg: ECGInformationDTO
    let appleMetaData: ECGAppleMetaDataDTO
    let algorithms: [RPeaksDTO]
    let signalQuality: [SignalQualityDTO]
    let deviceID: UUID
    
    private static var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
    
    private static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .json, encoder: encoder, decoder: decoder).suggestedFileName("PeakWatch_ECG_Recording")
    }
}
