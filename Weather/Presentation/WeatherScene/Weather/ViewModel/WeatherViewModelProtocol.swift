//
//  WeatherViewModelProtocol.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import CoreLocation

protocol WeatherViewModelProtocol: BaseViewModelProtocol {
    
    var weather: Weather? { get set }
    var location: CLLocation? { get set }
    
    func loadData(lat: Double, lon: Double)
    func loadDefaultData()
}
