//
//  ContainerTagItemView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import SwiftUI

struct TagContainerItemView: ContainerItemView {
    
    let item: Tag
    
    var body: some View {
        TagView(text: item.text)
    }
}
