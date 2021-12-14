//
//  Date.swift
//  Weather
//
//  Created by Mher Davtyan on 14.12.21.
//

import Foundation

extension Date {
    
    var weekday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: self)
//        DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: self)]
    }
    
    var hh_mm_xm: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: self)
    }
}
