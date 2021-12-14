//
//  Startup.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerDependencies() {
        
        // MARK: Local Storage Registration
        self.autoregister(RealmManagerProtocol.self, initializer: RealmManager.init)
        
        // MARK: Networking Registration
        self.autoregister(WeatherNetworkManagerProtocol.self, initializer: WeatherNetworkManager.init)
        
        // MARK: ViewModels Registration
        self.autoregister(WeatherViewModelProtocol.self, initializer: WeatherViewModel.init)
    }
}
