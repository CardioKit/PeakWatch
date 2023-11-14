//
//  CSVImportStream.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 14.11.23.
//

import Foundation
import CSV


class CSVImportStream: ImportStream {
    
    let csvReader: CSVReader
    
    init(fileURL: URL) throws {
        if let inputStream = InputStream(url: fileURL) {
            self.csvReader = try CSVReader(stream: inputStream)
        } else {
            fatalError("TODO implement exception")
        }
    }
    
    func getNextECG() throws -> ECGSample? {
        guard let row = csvReader.next() else {
            return nil
        }
        
        fatalError("TODO")
    }
    
    
}
