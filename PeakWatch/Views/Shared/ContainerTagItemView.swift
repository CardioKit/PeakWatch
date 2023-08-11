//
//  ContainerTagItemView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import SwiftUI

struct ContainerTagItemView: ContainerItemView {
    
    let item: Tag
    
    var body: some View {
        TagView(text: item.text)
    }
}
