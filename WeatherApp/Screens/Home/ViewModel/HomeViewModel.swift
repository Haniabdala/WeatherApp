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
    var items : [CityCoreData]?
    let model = HomeModel()
    
  mutating func retreiveData(){
    self.items =  model.fetchCities(context: context)
       }
    
  mutating func deleteSingleRecord(CityName city : CityCoreData){
    model.deleteCity(CityName: city, context: context)
    retreiveData()
   }
    
    mutating func deleteAllRecords(){
        let clearRequest = NSBatchDeleteRequest(fetchRequest: CityCoreData.fetchRequest())
        do {
            try  self.context.execute(clearRequest)
            try self.context.save()
        }catch{
        }
        retreiveData()
        }
}
