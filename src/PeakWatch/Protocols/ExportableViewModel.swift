//
//  ExportViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 14.11.23.
//

import Foundation
import PeakSwift
import SwiftUI


protocol ExportableViewModel: ObservableObject {
    
    associatedtype T: Transferable
    
    var isExportReady: Bool { get }
    
    var totalECGsToProcess: Double { get }
    
    var amountOfECGProcess: Double { get }
    
    var ecgExports: T? { get }
    
    func processAllECGs() async
    
    var algorithmsExecuted: [Algorithms] { get }
    
    var processTime: Duration { get }
}

extension ExportableViewModel {
    
    var algorithmsExecuted: [Algorithms] {
        Array(UserSettingsViewModel().selectedAlgorithms)
    }

}
