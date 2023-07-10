//
//  String+Extension.swift
//  GoodWeather
//
//  Created by Dominique Strachan on 6/27/23.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
