//
//  DefaultAlgorithmViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import Foundation
import PeakSwift

class UserSettingsViewModel: AlgorithmSelectable {
    
    private let defaults = UserDefaults.standard
    
    private let defaultAlgorithms = "defaultAlgorithms"
    
    @Published var selectedAlgorithms: Set<Algorithms> {
        didSet {
            saveSelectedAlgorithm()
        }
    }
    
    init() {
        let algorithmStrings = defaults.array(forKey: defaultAlgorithms) as? [String] ?? []
        
        let algorithmList = algorithmStrings.compactMap { algorithmString in
            Algorithms(rawValue: algorithmString)
        }
        
        if algorithmList.isEmpty {
            // If no defaults are selected, propose some defaults
            self.selectedAlgorithms = [.twoAverage, .christov]
        } else {
            // Otherwise use the user configured defaults
            self.selectedAlgorithms = Set(algorithmList)
        }
    }
    
    private func saveSelectedAlgorithm() {
         defaults.setValue(selectedAlgorithms.map {$0.rawValue}, forKey: defaultAlgorithms)
    }
}
    

