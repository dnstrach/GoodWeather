//
//  AddWeatherViewController.swift
//  GoodWeather
//
//  Created by Dominique Strachan on 6/26/23.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherViewController: UIViewController {
    
    private var addWeatherVM = AddWeatherViewModel()
    var delegate: AddWeatherDelegate?
    
    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveCityButtonPressed(_ sender: Any) {
        
        if let city = cityTextField.text {
            
            //Testing
            //let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=7de5bde986238e3456b2f5892ba22017&units=imperial")!
            
            addWeatherVM.addWeather(for: city) { (vm) in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
            
            /*
             //Testing
            let weatherResource = Resource<Any>(url: weatherURL) { data in
        
                return data
            }
            
            WebService().load(resource: weatherResource) { result in }
            */
        }
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
