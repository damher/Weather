//
//  Double.swift
//  Weather
//
//  Created by Mher Davtyan on 14.12.21.
//

import Foundation

extension Double {
    
    var string: String {
        String(describing: self)
    }
    
    var celsius: Int? {
        Int(self - 273.15)
    }
}
