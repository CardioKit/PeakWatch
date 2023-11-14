//
//  ECGImportDTOHelper.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 13.11.23.
//

import Foundation


struct ECGImportDTOHelper {
    
    
    static var jsonDecoder: JSONDecoder {
        JSONDecoder()
    }
    
    static func convertJSONToDTO(json: Data) throws -> ExternalDataSetDTO {
         try jsonDecoder.decode(ExternalDataSetDTO.self, from: json)
     }
    
    
    static func importDataset(fileUrl: URL) throws -> ExternalDataSetDTO {
            let data = try Data(contentsOf: fileUrl)
            return try convertJSONToDTO(json: data)

    }

    
}

