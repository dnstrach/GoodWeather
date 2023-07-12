//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Dominique Strachan on 6/26/23.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    //private var lastUnitSelection: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let userDefaults = UserDefaults.standard
//        if let value = userDefaults.value(forKey: "unit") as? String {
//            self.lastUnitSelection = Unit(rawValue: value)!
//        }
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //change TVC background and text color including status bar
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor(red: 25/255, green: 64/255, blue: 167/255, alpha: 1.0)
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        
        /*
         //here for testing -->  code moved to View Model
        let resource = Resource(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Houston&APPID=7de5bde986238e3456b2f5892ba22017&units=imperial")!) { data in
            
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
        }
        
        WebService().load(resource: resource) { weatherResponse in
            if let weatherResponse = weatherResponse {
                print(weatherResponse)
            }
        }
         */

    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        //print(vm)
        
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        
        cell.configure(weatherVM)
        
        //cell.cityLabel?.text = "Houston"
        //cell.temperatureLabel?.text = "70°"

        return cell
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "toSettingsTVC" {
            prepareSegueForSettingsTableViewController(segue: segue)
        }
    }
    
    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        
        guard let navigationC = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityVC = navigationC.viewControllers.first as? AddWeatherViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        
        addWeatherCityVC.delegate = self
    }
    
    func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found")
        }
        
        settingsTVC.delegate = self
    }

}

extension WeatherListTableViewController: SettingsDelegate {
    
    func settingsDone(vm: SettingsViewModel) {
//        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
//            weatherListViewModel.updateUnit(to: vm.selectedUnit)
//            tableView.reloadData()
//            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)!
//        }
        
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}
