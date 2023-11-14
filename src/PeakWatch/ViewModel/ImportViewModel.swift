//
//  ImportViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 13.11.23.
//

import Foundation

class ImportViewModel: ObservableObject {
    
    @Published var isOpenFileImport = false
    @Published var isLoading = true
    @Published var isError: String?
    
    @Published var exportViewModel: ExportStreamViewModel?
    
    init() {
     
    }
    
    func importExternalDataSet(resultImport: Result<URL, Error>) {
        Task {
            switch resultImport {
            case .success(let fileUrl):
                successHandler(fileUrl: fileUrl)
            case .failure(let failure):
                errorHandler(errorMessage: failure.localizedDescription)
            }
        }
    }
    
    private func errorHandler(errorMessage: String) {
        DispatchQueue.main.async {
            self.isError = errorMessage
        }
    }
    
    private func successHandler(fileUrl: URL) {
        
        if fileUrl.startAccessingSecurityScopedResource() {
            
            do {
                let importStream = try CSVImportStream(fileURL: fileUrl)
                let exportStream = CSVExportStream()
              
                DispatchQueue.main.async {
                    self.exportViewModel = ExportStreamViewModel(importStream: importStream, exportStream: exportStream)
                    self.isLoading = false
                }
                
            } catch {
                errorHandler(errorMessage: "Error setting up CSVStream!")
            }
            fileUrl.stopAccessingSecurityScopedResource()
        } else {
            errorHandler(errorMessage: "No permissions to view the file!")
        }
        
    }
    
    func reset() {
        DispatchQueue.main.async {
            self.isOpenFileImport = false
            self.isLoading = true
            self.isError = nil
        }
    }
    
}
