//
//  WeatherNetworkManagerProtocol.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import Foundation

protocol WeatherNetworkManagerProtocol {
    
    func getWeatherData<T: Decodable>(_ type: T.Type, lat: Double, lon: Double, completion: @escaping (Result<T>) -> Void)
}
