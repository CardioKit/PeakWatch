//
//  DateUtils.swift
//  PeakWatch
//
//  Created by x on 08.06.23.
//

import Foundation

struct DateUtils {
    
    
    static func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd.MM., HH:mm"
        return dateFormatter.string(from: date)
    }
}
