//
//  CitiesViewModel.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/26/20.
//

import Foundation
import CoreData
import UIKit

struct  HomeViewModel {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var cities : [CityCoreData]?
    let model = HomeModel()
    
  mutating func fetchCities(){
    self.cities =  model.retreiveData(context: context)
       }
    
  mutating func deleteCity(CityName city : CityCoreData){
    model.deleteSingleRecord(CityName: city, context: context)
    fetchCities()
   }
    
    mutating func clearCities (){
        model.deleteAllRecords(context: context)
        fetchCities()
}
}
