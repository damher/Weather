//
//  WeatherData.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import RealmSwift

class WeatherData: Object, Codable {
    @objc dynamic var current: CurrentWeather?
    var lat = RealmOptional<Double>()
    var lon = RealmOptional<Double>()
    var daily = List<DailyWeather>()
    var id = RealmOptional<Int>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lon
        case current
        case daily
        case id
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lat = try container.decode(RealmOptional<Double>.self, forKey: .lat)
        self.lon = try container.decode(RealmOptional<Double>.self, forKey: .lon)
        self.current = try container.decode(CurrentWeather.self, forKey: .current)
        self.daily = try container.decodeIfPresent(List<DailyWeather>.self, forKey: .daily) ?? List()
        self.id = RealmOptional<Int>(0)
    }
}
