//
//  APIRequest.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/27/20.
//

import Foundation


class APIRequest<T : Codable>{
    
    
    func prepareRequest(externalUrl: String){
        
        let task =  URLSession.shared.dataTask(with: URL(string: externalUrl)!, completionHandler: { (data, response, error) in
             
             guard let data = data , error == nil else{
                 print("Something Went Wrong")
                 return
             }
         
        })
    
        }
    
    func deserialize(data: Data?) -> Response? {
        guard let data = data else {
            return nil
        }
        print(String(data: data, encoding: .utf8))
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let object = try? jsonDecoder.decode( Response.self, from: data)
        return object
    }
}

