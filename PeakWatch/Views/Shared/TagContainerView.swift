//
//  TagContainerView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

// Based on https://stackoverflow.com/questions/62102647/swiftui-hstack-with-wrap-and-dynamic-height/62103264#62103264
// Also good Guide: https://blog.logrocket.com/implementing-tags-swiftui/
struct TagContainerView: View {
    
    let tags: [Tag]
    @State private var totalHeight = CGFloat.zero
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
           return GeometryReader { geometry -> Color in
               let rect = geometry.frame(in: .local)
               DispatchQueue.main.async {
                   binding.wrappedValue = rect.size.height
               }
               return .clear
           }
       }
    
    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return VStack {
            GeometryReader { geo in
               generateContent(in: geo)
                    .background(viewHeightReader($totalHeight))
            }
        }.frame(height: totalHeight)
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(tags) { tag in
                TagView(text: tag.text)
                    .padding(.all, 5)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        print(".leading")
                        if (abs(width - dimension.width) > geometry.size.width) {
                            width = 0
                            height -= dimension.height
                        }
                        let result = width
                        if tag.id == tags.last!.id {
                            width = 0
                        } else {
                            width -= dimension.width
                        }
                        return result
                    })
                    .alignmentGuide(.top) { dimension in
                        let result = height
                        if tag.id == tags.last!.id {
                            height = 0
                        }
                        return result
                    }
            }
        }
    }
}
