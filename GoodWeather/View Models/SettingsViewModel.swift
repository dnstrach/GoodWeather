//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Dominique Strachan on 7/8/23.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        get {
            switch(self) {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

class SettingsViewModel {
    
    let units = Unit.allCases
    private var _selectedUnit: Unit = Unit.fahrenheit
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            //var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String {
                //unitValue = value
                //return Unit(rawValue: unitValue)!
                return Unit(rawValue: value)!
            }
            
            return _selectedUnit
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
}
