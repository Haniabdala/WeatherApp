//
//  CityDetailViewModel.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/26/20.
//

import Foundation
import UIKit



struct  CityDetailViewModel {
        
    func getCurrentWeatherData(externalUrl : URL ,completion: @escaping(Response) -> Void){
        
        let task = URLSession.shared.dataTask(with: externalUrl) { (data, response, error) in
            
            guard let data = data , error == nil else{
                print("Something Went Wrong")
                return
            }
            
            do {
              let result = try JSONDecoder().decode(Response.self, from: data)
            
                completion(result)
                
            }catch{
                print("Failed To Convert")
            }
        }
        task.resume()
    }
    

}



