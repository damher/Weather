//
//  Result.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error?)
}
