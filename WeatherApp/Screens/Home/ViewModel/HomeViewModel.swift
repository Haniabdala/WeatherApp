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
    
   mutating func fetchCities(){

           do {
               
           let request  = CityCoreData.fetchRequest() as NSFetchRequest<CityCoreData>
               
             let sort = NSSortDescriptor(key: "name", ascending: true)
              request.sortDescriptors  = [sort]
            
            
            self.items = try context.fetch(request)
      
          
            
           }catch {
            print("Eror here")
           }
       }
    
    
    
    mutating func deleteCity(CityName city : CityCoreData){
        
        self.context.delete(city)
        do{
            
            try  self.context.save()
        }catch{
            
        }
 
        self.fetchCities()
        
        
    }
}
