//
//  CLLocation.swift
//  Weather
//
//  Created by Mher Davtyan on 14.12.21.
//

import CoreLocation

extension CLLocation {
    
    func getLocalityName(completion: @escaping (_ city: String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { (placemarks, error) -> Void in
            if error != nil {
                return
            } else if let city = placemarks?.first?.locality {
                completion(city, error)
            }
        }
    }
}
