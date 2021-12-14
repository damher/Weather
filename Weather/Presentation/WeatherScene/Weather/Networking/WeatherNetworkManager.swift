//
//  WeatherNetworkManager.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import Foundation

class WeatherNetworkManager: BaseNetworkManager, WeatherNetworkManagerProtocol {
    
    func getWeatherData<T>(_ type: T.Type, lat: Double, lon: Double, completion: @escaping (Result<T>) -> Void) where T: Decodable {
        
        let parametres = [
            Const.Key.lat.rawValue: "\(lat)",
            Const.Key.lon.rawValue: "\(lon)",
            Const.Key.exclude.rawValue: "\(Exclude.minutely.rawValue),\(Exclude.hourly.rawValue),\(Exclude.alerts.rawValue)",
            Const.Key.weatherAppId.rawValue: Const.weatherApiKey.rawValue
        ]
        
        session.execute(url: Endpoint.path(for: .data), parameters: parametres, headers: headers) { result in
            completion(result)
        }
    }
}
