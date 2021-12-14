//
//  Observable.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import Foundation

@propertyWrapper
class Observable<T> {

    let keyPath: AnyKeyPath

    weak var owner: BaseViewModelProtocol?

    init(for keyPath: AnyKeyPath) {
        self.keyPath = keyPath
    }

    var wrappedValue: T? {
        didSet {
            owner?.propertyChanged?(keyPath)
        }
    }

    var projectedValue: Observable {
        self
    }
}
