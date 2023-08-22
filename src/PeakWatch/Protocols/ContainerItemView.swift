//
//  ContainerItemView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import SwiftUI

protocol ContainerItemView: View {
    
    associatedtype Model
    
    init(item: Model)
    
}
