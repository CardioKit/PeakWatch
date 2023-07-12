//
//  ECGNotFoundView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct ECGNotFoundView: View {
    
    @ObservedObject var ecgViewModel: ECGViewModel
    
    let ecgNotFoundTitle = "No ECGs found."
    let ecgNotFoundText = "Please, try to record a few ECGs."
    let refreshButtonLabel = "Refresh"
    
    var body: some View {
        VStack {
            CardView(style: .red, padding: 0, cornerRadius: 5) {
                VStack {
                    VStack {
                        Text(ecgNotFoundTitle).modifier(HeaderViewModifier())
                        Text(ecgNotFoundText)
                    }.padding([.top, .bottom], 10)
                }.frame(maxWidth: .infinity)
            }
            Button {
                Task {
                    await ecgViewModel.getECGFromHealthStore()
                }
            } label: {
                Text(refreshButtonLabel).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
            }
            .buttonStyle(.borderedProminent)

        }
    }
}


