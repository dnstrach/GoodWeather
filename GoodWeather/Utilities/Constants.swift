//
//  Constants.swift
//  GoodWeather
//
//  Created by Dominique Strachan on 6/27/23.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            //get the default settings for temperature
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&APPID=7de5bde986238e3456b2f5892ba22017&units=\(unit)")!
        }
    }
}
