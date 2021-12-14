//
//  Endpoint.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import Foundation

enum Endpoint: String {
    case baseUrl = "https://api.openweathermap.org"
    case imageUrl = "https://openweathermap.org"
    
    static func path(for tail: Tail) -> String {
        baseUrl.rawValue + tail.rawValue
    }
    
    static func path(for image: String) -> String {
        baseUrl.rawValue + String(format: Tail.image.rawValue, image)
    }
}

// MARK: - Tail
enum Tail: String {
    case data = "/data/2.5/onecall"
    case image = "/img/w/%1$@.png"
}
