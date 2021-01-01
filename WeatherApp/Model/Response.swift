//
//  Response.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/27/20.
//

import Foundation

struct Response : Codable {
    var lat : Double
    var lon : Double
    var current : City
    var daily : [cityDaily]
}
