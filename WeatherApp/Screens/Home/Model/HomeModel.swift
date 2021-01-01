//
//  HomeModel.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/26/20.
//

import Foundation
import CoreData

class HomeModel {
    
    func retreiveData(context : NSManagedObjectContext) -> [CityCoreData] {
        var items = [CityCoreData]()
        do {
            let request  = CityCoreData.fetchRequest() as NSFetchRequest<CityCoreData>
            let sort = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors  = [sort]
            items = try context.fetch(request)
        }catch {
        }
        return items
    }

    func deleteSingleRecord(CityName city : CityCoreData , context : NSManagedObjectContext){
        context.delete(city)
        do{
            try  context.save()
        }catch{
        }
    }
    
    func deleteAllRecords(context : NSManagedObjectContext){
        let clearRequest = NSBatchDeleteRequest(fetchRequest: CityCoreData.fetchRequest())
        do {
            try  context.execute(clearRequest)
            try  context.save()
        }catch{
        }
    }
}
