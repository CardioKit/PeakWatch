//
//  CSVExportStream.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 14.11.23.
//

import Foundation

class JSONExportStream: ExportStream {
    
    let exportFileURL: URL
    private let exportFileName = "arrythmia"
    
    private var fileHandle: FileHandle?
    
    init() {
        self.exportFileURL = FileManager.default.temporaryDirectory.appendingPathComponent(exportFileName, conformingTo: .json)
        FileManager.default.createFile(atPath: self.exportFileURL.path(), contents: nil)
    }
    
    func openStream() throws {
        self.fileHandle = try FileHandle(forWritingTo: self.exportFileURL)
    }
    
    
    func exportECG(ecgExport: ECGExportDTO) throws {
        
        if fileHandle == nil {
            try openStream()
        }
        
        let jsonData = try ECGExportDTOHelper.convertToJSON(ecgExportDTO: ecgExport)
        
        if let fileHandle = self.fileHandle {
            try fileHandle.seekToEnd()
            fileHandle.write(jsonData)
        }
    }
    
    func getExportFile() -> URL {
        self.exportFileURL
    }
    
    
    

}
