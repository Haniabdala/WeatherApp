//
//  APISettings.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import Foundation

class APISettings {
    static let url = "https://api.openweathermap.org/data/2.5/"
    static let openWeatherApiKey = "118b8804be9a876210c79a4f3dae8b15"
    static func getcurrentWeatherUrl(forCity city: String) -> String {
        return"https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(APISettings.openWeatherApiKey)"
        
        
    }
    
  //  url =  "api.openweathermap.org/data/2.5/weather?q={Beirut}&appid={118b8804be9a876210c79a4f3dae8b15}"
       
    
}
