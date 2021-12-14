//
//  WeatherDetails.swift
//  Weather
//
//  Created by Mher Davtyan on 13.12.21.
//

import RealmSwift

class WeatherDetails: Object, Codable {
    var id = RealmOptional<Int>()
    @objc dynamic var main: String?
    @objc dynamic var weatherDescription: String?
    @objc dynamic var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case main
        case weatherDescription = "description"
        case icon
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(RealmOptional<Int>.self, forKey: .id)
        self.main = try container.decode(String.self, forKey: .main)
        self.weatherDescription = try container.decode(String.self, forKey: .weatherDescription)
        self.icon = try container.decode(String.self, forKey: .icon)
    }
}
