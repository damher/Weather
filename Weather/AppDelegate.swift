//
//  AppDelegate.swift
//  Weather
//
//  Created by Mher Davtyan on 11.12.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ServiceLocator.instance.registerDependencies()
        
        setupWindow()
        
        return true
    }
}

// MARK: - Setup
extension AppDelegate {
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = WeatherViewController(nibName: "\(WeatherViewController.self)", bundle: nil)
        window?.makeKeyAndVisible()
    }
}
