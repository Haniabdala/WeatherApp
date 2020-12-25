//
//  City.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import Foundation


struct City {
    
    var name = "Tester"
    var temperature : Double?
    var longitude : Double?
    var latitude : Double?
    var windSpeed : Double?
    var windDeg : Int?
    var humidity: Int?
    var icon : String?
    
    private enum CodingKeys: String, CodingKey {
        case temp = "temperature"
        case humidity
        case wind
        
  
    }
    
}
