//
//  AlgorithmSelectable.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import Foundation
import PeakSwift

protocol AlgorithmSelectable: ObservableObject {
    
    var selectedAlgorithms: Set<Algorithms> { get set }
}
