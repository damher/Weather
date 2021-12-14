//
//  BaseNetworkManager.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import Foundation

class BaseNetworkManager {
    
    let session: URLSession
    
    var headers: [String: String] {
        [Const.Key.contentType.rawValue: Const.applicationJson.rawValue]
    }
        
    // MARK: Init
    init() {
        self.session = URLSession.shared
    }
}
