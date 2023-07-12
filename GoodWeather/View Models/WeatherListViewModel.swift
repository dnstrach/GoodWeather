//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Dominique Strachan on 6/27/23.
//

import Foundation

struct WeatherListViewModel {
    
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel) {
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
    
    mutating private func toCelsius() {
        
       weatherViewModels = weatherViewModels.map { vm in
            
//           let weatherModel = vm
//           weatherModel.temperature = (weatherModel.temperature - 32) * 5/9
            var weatherModel = vm
            weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature - 32) * 5/9
            return weatherModel
            
        }
    }
    
    mutating private func toFahrenheit() {
        
        weatherViewModels = weatherViewModels.map { vm in
            
//            let weatherModel = vm
//            weatherModel.temperature = (weatherModel.temperature * 9/5) + 32
            var weatherModel = vm
            weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature * 9/5) + 32
            return weatherModel
            
        }
        
    }
    
    mutating func updateUnit(to unit: Unit) {
        
        switch unit {
            case .celsius:
                toCelsius()
            case .fahrenheit:
                toFahrenheit()
        }
        
    }
    
}

//class WeatherViewModel {
struct WeatherViewModel: Decodable {
    
    //let weather: WeatherResponse
    let name: String
    //var temperature: Double
    var currentTemperature: TemperatureViewModel
    
//    init(weather: WeatherResponse) {
//        self.weather = weather
//        temperature = weather.main.temp
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
    
//    var city: String {
//        return weather.name
//    }
    
}

struct TemperatureViewModel: Decodable {
    
    var temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
