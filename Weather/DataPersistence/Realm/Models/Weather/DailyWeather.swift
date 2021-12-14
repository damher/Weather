//
//  DailyWeather.swift
//  Weather
//
//  Created by Mher Davtyan on 13.12.21.
//

import RealmSwift

class DailyWeather: Object, Codable {
    var date = RealmOptional<Int>()
    var min = RealmOptional<Double>()
    var max = RealmOptional<Double>()
    
    enum TempCodingKeys: String, CodingKey {
        case date = "dt"
        case temp
    }
    
    enum CodingKeys: String, CodingKey {
        case min
        case max
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let tempContainer = try decoder.container(keyedBy: TempCodingKeys.self)
        self.date = try tempContainer.decode(RealmOptional<Int>.self, forKey: .date)
        
        let container = try tempContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .temp)
        self.min = try container.decode(RealmOptional<Double>.self, forKey: .min)
        self.max = try container.decode(RealmOptional<Double>.self, forKey: .max)
    }
}
