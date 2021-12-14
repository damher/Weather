//
//  RealmManagerProtocol.swift
//  Weather
//
//  Created by Mher Davtyan on 14.12.21.
//

import RealmSwift

protocol RealmManagerProtocol {
    func objects<T: Object>(_ type: T.Type) -> [T]
    
    @discardableResult func update<T: Object>(_ object: T?) -> Bool
}
