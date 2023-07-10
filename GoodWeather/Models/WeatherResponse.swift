//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by Dominique Strachan on 6/27/23.
//

import Foundation

//created struct to map top level of response since temp is not root of JSON
//main property contains object containing temp, humidity keys
struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    //model variable names much match JSON keys
    let temp: Double
    let humidity: Double
}
