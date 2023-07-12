//
//  AddWeatherViewController.swift
//  GoodWeather
//
//  Created by Dominique Strachan on 6/26/23.
//

//"https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=7de5bde986238e3456b2f5892ba22017&units=imperial"

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherViewController: UIViewController {
    
    //private var addWeatherVM = AddWeatherViewModel()
    var delegate: AddWeatherDelegate?
    
    @IBOutlet weak var cityTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveCityButtonPressed(_ sender: Any) {
        
        if let city = cityTextField.text {
            
//            addWeatherVM.addWeather(for: city) { (vm) in
//                self.delegate?.addWeatherDidSave(vm: vm)
//                self.dismiss(animated: true, completion: nil)
//            }
        
            //for cities with more than word - added coded value for space
            let txtAppend = (city).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(txtAppend ?? "")&APPID=7de5bde986238e3456b2f5892ba22017&units=imperial")!
        
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
            
            let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
            return weatherVM
        }
        
        WebService().load(resource: weatherResource) { [weak self] result in
            
            if let weatherVM = result {
                
                if let delegate = self?.delegate {
                    delegate.addWeatherDidSave(vm: weatherVM)
                    self?.dismiss(animated: true, completion: nil)
                }
                
            }
            
        }
        
        
    }
        
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
