//
//  CitiesViewModel.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/26/20.
//

import Foundation
import CoreData
import UIKit
import MapKit

class MapViewModel : UIViewController {
    
    let model = MapModel()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    func fetchCities() -> [CityCoreData]{

       
        var items = [CityCoreData]()
           do {
               
           let request  = CityCoreData.fetchRequest() as NSFetchRequest<CityCoreData>
               
             let sort = NSSortDescriptor(key: "name", ascending: true)
              request.sortDescriptors  = [sort]
            
            
             items = try context.fetch(request)
            
           }catch {
            print("Eror here")
           }
        return items
       }
    
    
    func inserCity(CityName City : String , Latitude lat: Double, Longitude long: Double )  {
        
        let newCity = CityCoreData(context: self.context)
        newCity.name = City
        newCity.latitude = lat
        newCity.longitude = long
        
        do{
            try  self.context.save()
        }catch{
            
        }
    }}
