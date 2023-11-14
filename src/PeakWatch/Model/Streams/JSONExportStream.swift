//
//  CSVExportStream.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 14.11.23.
//

import Foundation

class JSONExportStream: ExportStream {
    
    
    let exportFileURL: URL
    private let exportFileName = FileNameHelper.createFileName(suffix: "Dataset_External")
    
    private var fileHandle: FileHandle?
    
    private let prefixExport = "{ \"ecgs\":[".data(using: .utf8)!
    private let delimiter = ",".data(using: .utf8)!
    private let suffixExport = "]}".data(using: .utf8)!
    
    private var isFirst = true
    
    init() {
        self.exportFileURL = FileManager.default.temporaryDirectory.appendingPathComponent(exportFileName, conformingTo: .json)
        FileManager.default.createFile(atPath: self.exportFileURL.path(), contents: prefixExport)
    }
    
    func openStream() throws {
        self.fileHandle = try FileHandle(forWritingTo: self.exportFileURL)
    }
    
    
    func exportECG(ecgExport: ECGExportDTO) throws {
        
        let jsonData = try ECGExportDTOHelper.convertToJSON(ecgExportDTO: ecgExport)
        
        if (!isFirst) {
            try writeToFile(data: delimiter)
        } else {
            isFirst = false
        }
        
        try writeToFile(data: jsonData)
      
        
    }
    
    func writeToFile(data: Data) throws {
        
        if fileHandle == nil {
            try openStream()
        }
        
        if let fileHandle = self.fileHandle {
            try fileHandle.seekToEnd()
            fileHandle.write(data)
        }
    }
    
    func getExportFile() throws -> URL {
        try writeToFile(data: suffixExport)
        return self.exportFileURL
    }
    
    
    

}
