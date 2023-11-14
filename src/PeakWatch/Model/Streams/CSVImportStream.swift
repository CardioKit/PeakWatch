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
    
    let DEFAULT_SAMPLING_RATE = 500.0
    
    init(fileURL: URL) throws {
        if let inputStream = InputStream(url: fileURL) {
            self.csvReader = try CSVReader(stream: inputStream)
        } else {
            throw ImportError.fileError
        }
    }
    
    func getNextECG() throws -> ECGSample? {
        guard let row = csvReader.next() else {
            return nil
        }
        
        let ecg = row.map(Double.init)
        let ecgWithoutNil = ecg.compactMap { $0 }
        let samplingRate = DEFAULT_SAMPLING_RATE
        
        guard ecgWithoutNil.count != ecg.count else {
            throw ImportError.typeError(message: "ECGs are not numeric!")
        }
        
        
        return ECGSample.createFromExternalDataset(ecg: ecgWithoutNil, samplingRate: samplingRate)
    }
    
    
}
