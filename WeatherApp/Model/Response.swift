//
//  Response.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/27/20.
//

import Foundation


struct Response : Codable {
   
   var timezone: Int
    var name : String
    var cod : Int
    var main : City
}

struct City : Codable {
    
    var temp : Double
    var pressure : Int
    var humidity : Int
    var temp_max : Double
    var temp_min : Double
    
    
}
