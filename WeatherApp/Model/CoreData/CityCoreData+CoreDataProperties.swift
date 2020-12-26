//
//  CityCoreData+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/26/20.
//
//

import Foundation
import CoreData


extension CityCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CityCoreData> {
        return NSFetchRequest<CityCoreData>(entityName: "CityCoreData")
    }

    @NSManaged public var name: String?
    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double

}

extension CityCoreData : Identifiable {

}
