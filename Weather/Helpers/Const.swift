//
//  Const.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import Foundation

enum Const: String {
    
    enum Key: String {
        case contentType = "Content-Type"
        case weatherAppId = "appid"
        case lon
        case lat
        case exclude
    }
    
    case applicationJson = "application/json"
    case weatherApiKey = "9557544fbd9b4d5492e992d9be5f043c"
}
