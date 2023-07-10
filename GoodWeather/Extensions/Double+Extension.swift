//
//  Double+Extension.swift
//  GoodWeather
//
//  Created by Dominique Strachan on 6/27/23.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}
