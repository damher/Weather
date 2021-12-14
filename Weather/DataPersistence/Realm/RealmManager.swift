//
//  RealmManager.swift
//  Weather
//
//  Created by Mher Davtyan on 13.12.21.
//

import RealmSwift

class RealmManager: RealmManagerProtocol {
    
    private var realm: Realm? {
        let configuration = Realm.Configuration(schemaVersion: 1)
        return try? Realm(configuration: configuration)
    }
    
    // MARK: Get objects
    func objects<T: Object>(_ type: T.Type) -> [T] {
        guard let realm: Realm = self.realm else { return [] }
        return realm.objects(type).map({ $0 })
    }
    
    // MARK: Modify object
    func update<T: Object>(_ object: T?) -> Bool {
        guard let object: T = object else { return false }
        guard let realm: Realm = self.realm else { return false }
        
        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
            return true
        } catch let error {
            debugPrint("Writing failed for ", String(describing: T.self), " with error ", error)
        }
        return false
    }
}
