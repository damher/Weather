//
//  DailyWeatherTableViewCell.swift
//  Weather
//
//  Created by Mher Davtyan on 14.12.21.
//

import UIKit

class DailyWeatherTableViewCell: UITableViewCell {

    @IBOutlet private weak var weekLabel: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!
    @IBOutlet private weak var maxTempLabel: UILabel!
    
    func setData(_ data: (date: String?, min: String?, max: String?)?) {
        weekLabel.text = data?.date
        minTempLabel.text = data?.min
        maxTempLabel.text = data?.max
    }
}
