//
//  CityDaily.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 1/1/21.
//

import Foundation

struct cityDaily : Codable {
    var pressure : Int
    var temp : CityDailytemperature
}

struct CityDailytemperature : Codable {
    var day : Double
}
