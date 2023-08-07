//
//  ECGExport.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct ECGExportDTO: Codable {
    
    let ecg: ECGInformationDTO
    let appleMetaData: ECGAppleMetaDataDTO
    let algorithms: [RPeaksDTO]
    let signalQuality: [SignalQualityDTO]
    let deviceID: UUID?
    
    static func createECGExportDTO(algorithmViewModel: AlgorithmViewModel) -> ECGExportDTO {
        // The id should be unique. The same id is generated for apps that come from the same vendor running on the same device.
        let deviceId = UIDevice.current.identifierForVendor
        
        let ecgDTO = ECGInformationDTO.createECGDTO(algorithmViewModel: algorithmViewModel)
        let appleMetaDataDTO = ECGAppleMetaDataDTO.createAppleMetaDataDTO(algorithmViewModel: algorithmViewModel)
        let rPeaksDTO = RPeaksDTO.createRPeaksDTO(algorithmViewModel: algorithmViewModel)
        let signalQuality = SignalQualityDTO.createSignalQualityDTO(algorithmViewModel: algorithmViewModel)
        
        return .init(ecg: ecgDTO, appleMetaData: appleMetaDataDTO, algorithms: rPeaksDTO, signalQuality: signalQuality, deviceID: deviceId)
    }
}

extension ECGExportDTO: Transferable {
    
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(exportedContentType: .json) { ecgExport in
            return try ECGExportDTOHelper.export(exportable: ecgExport)
        }
    }
    
}