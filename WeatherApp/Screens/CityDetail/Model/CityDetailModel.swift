//
//  CityDetailModel.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/28/20.
//

import Foundation


class CityDetailModel {
    
    
    func genDays(index : IndexPath) -> String{
        let date = Date()
        var dateComponent = DateComponents()
        let addDay =  index[1] + 1
        dateComponent.day = addDay
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: date)
        let formater = DateFormatter()
        formater.dateFormat = "EEEE"
        return formater.string(from: futureDate!)
        }

    
}
