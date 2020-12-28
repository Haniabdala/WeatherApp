//
//  City.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import Foundation



struct City : Codable {
    
    var temp : Double
    var pressure : Int
    var humidity : Int
    var weather :  [Weather]
}

struct  Weather : Codable {
    var main : String
}


struct cityDaily : Codable {
    var pressure : Int
    var temp : CityDailytemperature
}

struct CityDailytemperature : Codable {
    var day : Double
}
