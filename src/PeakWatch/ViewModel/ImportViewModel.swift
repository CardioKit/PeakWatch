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
    @Published var isError = false
    
    init(isLoading: Bool = false, isError: Bool = false) {
        self.isLoading = isLoading
        self.isError = isError
    }
    
    func importExternalDataSet(resultImport: Result<URL, Error>) {
        Task {
            switch resultImport {
            case .success(let fileUrl):
                successHandler(fileUrl: fileUrl)
            case .failure(let failure):
                errorHandler()
            }
        }
    }
    
    private func errorHandler() {
        self.isError = false
    }
    
    private func successHandler(fileUrl: URL) {
        do {
            let importECG = try ECGImportDTOHelper.importDataset(fileUrl: fileUrl)
            
            isLoading = false
        } catch {
            errorHandler()
        }
    }
    
}
