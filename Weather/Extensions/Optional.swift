//
//  Optional.swift
//  Weather
//
//  Created by Mher Davtyan on 13.12.21.
//

import Foundation

extension Optional where Wrapped == Int {
    
    var string: String {
        if let self = self {
            return String(describing: self)
        }
        
        return "-"
    }
}

extension Optional where Wrapped == Double {
    
    var string: String {
        if let self = self {
            return String(describing: self)
        }
        
        return "-"
    }
}
