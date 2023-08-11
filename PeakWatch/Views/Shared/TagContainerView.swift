//
//  TagContainerView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct TagContainerView: View {
    
    let tags: [Tag]
    
    var body: some View {
        ContainerView<ContainerTagItemView>(items: tags)
    }
}
   
