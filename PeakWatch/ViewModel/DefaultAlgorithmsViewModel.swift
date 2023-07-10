//
//  DefaultAlgorithmViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import Foundation
import PeakSwift

class DefaultAlgorithmsViewModel: AlgorithmSelectable {
    
    @Published var selectedAlgorithms: Set<Algorithms> = [.panTompkins, .twoAverage]
    
    
    
}
