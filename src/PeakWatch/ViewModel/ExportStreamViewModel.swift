//
//  ExportViewStreamViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 14.11.23.
//

import Foundation

class ExportStreamViewModel: ExportableViewModel {
    
    // Interface properties
    var isExportReady: Bool {
        return false
    }
    
    var totalECGsToProcess: Double {
        return 100000
    }
    
    var amountOfECGProcess: Double {
        return 0
    }
    
    @Published var ecgExports: AllECGExportDTO = AllECGExportDTO(ecgs: [])
    
    
    // Internal properties
    
    let importStream: ImportStream
    let exportStream: ExportStream
    
    init(importStream: ImportStream, exportStream: ExportStream) {
        self.importStream = importStream
        self.exportStream = exportStream
    }
    
    
    func processAllECGs() async {
        
    }
    
    
    
    
    
}
