//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import CoreLocation

class WeatherViewModel: BaseViewModel, WeatherViewModelProtocol {
    
    // MARK: Managers
    private let networkManager: WeatherNetworkManagerProtocol
    private let realmManager: RealmManagerProtocol
    
    // MARK: Observable properties
    @Observable(for: \WeatherViewModelProtocol.weather)
    var weather: Weather?
    
    @Observable(for: \WeatherViewModelProtocol.location)
    var location: CLLocation?
    
    // MARK: Init
    init(networkManager: WeatherNetworkManagerProtocol, realmManager: RealmManagerProtocol) {
        self.networkManager = networkManager
        self.realmManager = realmManager
        
        super.init()
        
        $weather.owner = self
        $location.owner = self
    }
}

// MARK: - Requests
extension WeatherViewModel {
    
    func loadData(lat: Double, lon: Double) {
        networkManager.getWeatherData(WeatherData.self, lat: lat, lon: lon) { [weak self] result in
            switch result {
            case .success(let data):
                self?.weather = data.toWeatherModel()
                
                DispatchQueue.main.async {
                    self?.realmManager.update(data)
                }
            case .failure(let error):
                if let error = error {
                    debugPrint(error)
                }
            }
        }
    }
}

// MARK: - Fetch local storage
extension WeatherViewModel {
    
    func loadDefaultData() {
        weather = realmManager.objects(WeatherData.self).first?.toWeatherModel()
    }
}
