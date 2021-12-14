//
//  WeatherDataViewModel.swift
//  Weather
//
//  Created by Mher Davtyan on 14.12.21.
//

import Foundation
import CoreLocation

struct Weather {
    let lat: Double?
    let lon: Double?
    let sunrise: String?
    let sunset: String?
    let temp: String?
    let windSpeed: String?
    let pressure: String?
    let humidity: String?
    let clouds: String?
    let description: String?
    let icon: String?
    let daily: [(date: String?, min: String?, max: String?)]
    
    func locality(_ completion: @escaping  (String?) -> Void) {
        if let lat = lat, let lon = lon {
            CLLocation(latitude: lat, longitude: lon).getLocalityName { city, error in
                completion(city)
            }
        }
    }
}

extension WeatherData {
    
    func toWeatherModel() -> Weather {
        
        let main = current?.weather.first?.main
        let description = current?.weather.first?.weatherDescription
        let temp = current?.temp.value?.celsius.string
        let sunrise = current?.sunrise.value?.date?.hh_mm_xm
        let sunset = current?.sunset.value?.date?.hh_mm_xm
        let clouds = current?.clouds.value.string
        let windSpeed = current?.windSpeed.value.string
        let humidity = current?.humidity.value.string
        let pressure = current?.pressure.value.string
        let daily: [(String?, String?, String?)] = daily.map {
            ($0.date.value?.date?.weekday, $0.min.value?.celsius.string, $0.max.value?.celsius.string)
        }
        
        return Weather(lat: lat.value,
                                    lon: lon.value,
                                    sunrise: sunrise == nil ? nil : "Sunrise: " + sunrise!,
                                    sunset: sunset == nil ? nil : "Sunset: " + sunset!,
                                    temp: temp == nil ? nil : temp! + "°",
                                    windSpeed: windSpeed == nil ? nil : "Wind speed: " + windSpeed!,
                                    pressure: pressure == nil ? nil : "Pressure: " + pressure! + " hPa",
                                    humidity: humidity == nil ? nil : "Humidity: " + humidity! + "%",
                                    clouds: clouds == nil ? nil : "Sunrise: " + clouds! + "%",
                                    description: (main == nil && description == nil) ? nil : main! + " - " + description!,
                                    icon: current?.weather.first?.icon,
                                    daily: daily)
    }
}
