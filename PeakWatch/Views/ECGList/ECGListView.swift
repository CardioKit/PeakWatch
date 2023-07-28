//
//  ECGList.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import Foundation
import SwiftUI

struct ECGListView: View {
    
    @ObservedObject var ecgViewModel: ECGViewModel
    
    var books:[Book] = (1...100).map { _ in
        Book()
    }
    
    struct Book: Identifiable {
        var id = UUID()
        var text  = "Book"
    }
    
    func bookView(_ text: Book) -> some View {
        return Text(text.text).task {
            print("load \(text.id)")
        }
    }
    
    var body: some View {
//        VStack {
//            List(ecgViewModel.ecgs) { (ecg)  in
//                NavigationLink(destination: ECGDetailView(ecgSample: ecg.hkEcg!)) {
//                    ECGRowView(ecg: ecg, hkECG: ecg.hkEcg!)
//                }
//            }
//        }
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(ecgViewModel.ecgs) { (ecg)  in
                    NavigationLink(destination: ECGDetailView(ecgSample: ecg.hkEcg!)) {
                        ECGRowView(ecg: ecg, hkECG: ecg.hkEcg!)
                    }
                }
            }
        }
//            List(books) { book in
//                bookView(book)
//            }
        }
    
    
}

