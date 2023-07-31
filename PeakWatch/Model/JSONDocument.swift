//
//  JSONDocument.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct JSONDocument: FileDocument {
    
    static var readableContentTypes = [UTType.json]
    
    var text = ""
    
    init(text: String = "empty text") {
        self.text = text
    }
    
    // this initializer loads data that has been saved previously
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        }
    }

    // this will be called when the system wants to write our data to disk
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}
