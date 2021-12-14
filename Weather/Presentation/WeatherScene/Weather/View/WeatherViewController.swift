//
//  WeatherViewController.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import UIKit
import CoreLocation
import Kingfisher

class WeatherViewController: UIViewController {

    // MARK: Views
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var weatherIconView: UIImageView!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var sunriseLabel: UILabel!
    @IBOutlet private weak var sunsetLabel: UILabel!
    @IBOutlet private weak var cloudsLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    
    // MARK: Properties
    private var locationManager: CLLocationManager?
    private var viewModel: WeatherViewModelProtocol?
    private let tableViewCellRowHeight: CGFloat = 50
    
    private var rowsCount: Int {
        let dataCount = viewModel?.weather?.daily.count ?? 0
        return dataCount > 7 ? 7 : dataCount
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModels()
        setupLocationManager()
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown:
            tableViewHeightConstraint.constant = CGFloat(rowsCount) * tableViewCellRowHeight
        case .landscapeLeft, .landscapeRight:
            if CGFloat(rowsCount) * tableViewCellRowHeight > view.frame.height {
                tableViewHeightConstraint.constant = view.frame.height
            }
        default:
            break
        }
    }
}

// MARK: - Setup
extension WeatherViewController {
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "\(DailyWeatherTableViewCell.self)", bundle: nil),
                           forCellReuseIdentifier: "\(DailyWeatherTableViewCell.self)")
        tableViewHeightConstraint.constant = CGFloat(rowsCount) * tableViewCellRowHeight
    }
    
    private func setupViewModels() {
        viewModel = ServiceLocator.instance.resolve(WeatherViewModelProtocol.self)
        
        viewModel?.propertyChanged = { [weak self] path in
            switch path {
            case \WeatherViewModelProtocol.weather:
                DispatchQueue.main.async {
                    self?.updateUI()
                }
            case \WeatherViewModelProtocol.location:
                if let lat = self?.viewModel?.location?.coordinate.latitude,
                   let lon = self?.viewModel?.location?.coordinate.longitude {
                    self?.viewModel?.loadData(lat: lat, lon: lon)
                }
            default:
                break
            }
        }
        
        viewModel?.loadDefaultData()
    }
    
    private func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestAlwaysAuthorization()
    }
}

// MARK: - Update UI
private extension WeatherViewController {
    
    private func updateUI() {
        updateCurrentWeather()
        reloadTableView()
    }
    
    private func updateCurrentWeather() {
        viewModel?.weather?.locality({ [weak self] in self?.cityLabel.text = $0 })
        
        descriptionLabel.text = viewModel?.weather?.description
        tempLabel.text = viewModel?.weather?.temp
        sunriseLabel.text = viewModel?.weather?.sunrise
        sunsetLabel.text = viewModel?.weather?.sunset
        cloudsLabel.text = viewModel?.weather?.clouds
        windSpeedLabel.text = viewModel?.weather?.windSpeed
        humidityLabel.text = viewModel?.weather?.humidity
        pressureLabel.text = viewModel?.weather?.pressure
        
        if let icon = viewModel?.weather?.icon {
            weatherIconView.kf.setImage(with: URL(string: Endpoint.path(for: icon)))
        }
    }
    
    private func reloadTableView() {
        tableViewHeightConstraint.constant = CGFloat(rowsCount) * tableViewCellRowHeight
        tableView.reloadData()
    }
}

// MARK: - CLLocationManagerDelegate
extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(DailyWeatherTableViewCell.self)", for: indexPath) as! DailyWeatherTableViewCell
        cell.setData(viewModel?.weather?.daily[indexPath.row])
        return cell
    }
}

extension WeatherViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableViewCellRowHeight
    }
}
    
// MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if viewModel?.location == nil {
            viewModel?.location = manager.location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
    }
}
