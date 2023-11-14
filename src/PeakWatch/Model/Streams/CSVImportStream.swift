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
    
    func getNextECG() -> ECGSample? {
        guard let row = csvReader.next() else {
            return nil
        }
        
        #warning("Improve add exception here") 
        let ecg = row.compactMap(Double.init)
        let samplingRate = 512.0
        
        return ECGSample.createFromExternalDataset(ecg: ecg, samplingRate: samplingRate)
    }
    
    
}
