//
//  BaseViewModel.swift
//  Weather
//
//  Created by Mher Davtyan on 14.12.21.
//

import Foundation

class BaseViewModel: BaseViewModelProtocol {
    
    var propertyChanged: ((AnyKeyPath) -> Void)?
}
