//
//  ContainerView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import SwiftUI


// Based on https://stackoverflow.com/questions/62102647/swiftui-hstack-with-wrap-and-dynamic-height/62103264#62103264
// Also good Guide: https://blog.logrocket.com/implementing-tags-swiftui/
struct ContainerView<WrapperView: ContainerItemView>: View where WrapperView.Model: Identifiable {
    
    let items: [WrapperView.Model]
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
            ForEach(items) { item in
                WrapperView(item: item)
                    .padding(.all, 5)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        if (abs(width - dimension.width) > geometry.size.width) {
                            width = 0
                            height -= dimension.height
                        }
                        let result = width
                        if item.id == items.last!.id {
                            width = 0
                        } else {
                            width -= dimension.width
                        }
                        return result
                    })
                    .alignmentGuide(.top) { dimension in
                        let result = height
                        if item.id == items.last!.id {
                            height = 0
                        }
                        return result
                    }
            }
        }
    }
}
