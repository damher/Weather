//
//  BaseViewModelProtocol.swift
//  Weather
//
//  Created by Mher Davtyan on 14.12.21.
//

import Foundation

protocol BaseViewModelProtocol: AnyObject {
    
    var propertyChanged: ((AnyKeyPath) -> Void)? { get set }
}
