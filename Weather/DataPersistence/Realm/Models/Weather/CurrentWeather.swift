//
//  CurrentWeather.swift
//  Weather
//
//  Created by Mher Davtyan on 13.12.21.
//

import RealmSwift

class CurrentWeather: Object, Codable {
    var date = RealmOptional<Int>()
    var sunrise = RealmOptional<Int>()
    var sunset = RealmOptional<Int>()
    var temp = RealmOptional<Double>()
    var windSpeed = RealmOptional<Double>()
    var pressure = RealmOptional<Int>()
    var humidity = RealmOptional<Int>()
    var clouds = RealmOptional<Int>()
    var weather = List<WeatherDetails>()

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case sunrise
        case sunset
        case temp
        case pressure
        case humidity
        case clouds
        case windSpeed = "wind_speed"
        case weather
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(RealmOptional<Int>.self, forKey: .date)
        self.sunrise = try container.decode(RealmOptional<Int>.self, forKey: .sunrise)
        self.sunset = try container.decode(RealmOptional<Int>.self, forKey: .sunset)
        self.temp = try container.decode(RealmOptional<Double>.self, forKey: .temp)
        self.pressure = try container.decode(RealmOptional<Int>.self, forKey: .pressure)
        self.humidity = try container.decode(RealmOptional<Int>.self, forKey: .humidity)
        self.clouds = try container.decode(RealmOptional<Int>.self, forKey: .clouds)
        self.windSpeed = try container.decode(RealmOptional<Double>.self, forKey: .windSpeed)
        self.weather = try container.decodeIfPresent(List<WeatherDetails>.self, forKey: .weather) ?? List()
    }
}
