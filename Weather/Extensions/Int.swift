//
//  Int.swift
//  Weather
//
//  Created by Mher Davtyan on 14.12.21.
//

import Foundation

extension Int {
    
    var string: String {
        String(describing: self)
    }
    
    var date: Date? {
        Date(timeIntervalSince1970: TimeInterval(self) / 1000)
    }
}
