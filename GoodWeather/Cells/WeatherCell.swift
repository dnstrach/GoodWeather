//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Dominique Strachan on 6/27/23.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel) {
        self.cityLabel.text = vm.name
        //self.temperatureLabel.text = "\(vm.temperature.formatAsDegree())"
        self.temperatureLabel.text = "\(vm.currentTemperature.temperature.formatAsDegree())"
    }
    
}
