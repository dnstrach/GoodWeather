//
//  SettingsViewModelTest.swift
//  GoodWeatherTests
//
//  Created by Dominique Strachan on 7/11/23.
//

import XCTest
//provides access to GoodWeather app files
@testable import GoodWeather

class SettingsViewModelTest: XCTestCase {

    private var settingsVM: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        self.settingsVM = SettingsViewModel()
    }
    
    func test_return_correct_display_name_for_fahrenheit() {
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Fahrenheit")
    }
    
    //test functions must be named with test keyword
    func test_default_unit_is_fahrenheit() {
        
        XCTAssertEqual(settingsVM.selectedUnit, .fahrenheit)
    }
    
    func test_save_user_unit_selection() {
        
        self.settingsVM.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
    override func tearDown() {
        super.tearDown()
        
        //removing added key/value from user defaults from save selected unit test
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }

}
