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
    var wind_speed : Double
    var weather :  [Weather]
}

struct  Weather : Codable {
    var main : String
    var description : String
    var icon : String
}
