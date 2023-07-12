//
//  WeatherListViewModelTest.swift
//  GoodWeatherTests
//
//  Created by Dominique Strachan on 7/11/23.
//

import XCTest
@testable import GoodWeather

final class WeatherListViewModelTest: XCTestCase {
    
    private var weatherListVM: WeatherListViewModel!

    override func setUp() {
        super.setUp()
        
        self.weatherListVM = WeatherListViewModel()
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(name: "Mission Viejo", currentTemperature: TemperatureViewModel(temperature: 70, temperatureMin: 0, temperatureMax: 0)))
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(name: "Las Vegas", currentTemperature: TemperatureViewModel(temperature: 98, temperatureMin: 0, temperatureMax: 0)))
    }
    
    func test_convert_to_celsius_successfully() {
        
        let celsiusTemps = [21.1111, 36.6667]
        self.weatherListVM.updateUnit(to: .celsius)
        
        for (index, vm) in self.weatherListVM.weatherViewModels.enumerated() {
            XCTAssertEqual(round(vm.currentTemperature.temperature), round(celsiusTemps[index]))
        }
    }
    
    override func tearDown() {
        
    }

}
