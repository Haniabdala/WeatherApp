//
//  CitiesViewModel.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/26/20.
//

import Foundation
import CoreData
import UIKit

class CitiesViewModel : UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    func inserCity(CityNamE City : String , Latitude lat: Double, Longitude long: Double )  {
        
        let newCity = CityCoreData(context: self.context)
        newCity.name = City
        newCity.latitude = lat
        newCity.longitude = long
        
        do{
            try  self.context.save()
        }catch{
            
        }
    }
    
}
