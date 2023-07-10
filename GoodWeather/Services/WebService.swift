//
//  WebService.swift
//  GoodWeather
//
//  Created by Dominique Strachan on 6/27/23.
//

import Foundation

//<T> - generic type
struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

//final - no inheritance
final class WebService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
       
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            print(data)
            
            if let data = data {
                //updates API request to be passed onto main thread instead of background thread
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}
