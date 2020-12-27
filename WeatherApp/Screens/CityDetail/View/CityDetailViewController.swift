//
//  CityDetailViewController.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/26/20.
//

import UIKit

class CityDetailViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    
    var cityName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urldata =  APISettings.getcurrentWeatherUrl(forCity: cityName)
  
        guard  let urlString = URL(string: urldata) else {
            fatalError()
        }
    
  
        getData(externalUrl: urlString )
    }
   
    func getData(externalUrl : URL){
       let task =  URLSession.shared.dataTask(with: externalUrl) { (data, response, error) in
            
            guard let data = data , error == nil else{
                print("Something Went Wrong")
                return
            }
            
            var result : Response?
            
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
                
            }catch{
                print("fAILED TO CONVERT")
            }
            
            guard let json = result else {
                print("no data")
                return
            }
        
        DispatchQueue.main.async {
            self.cityNameLabel.text = json.name
             
        }
     
        print(json.name)
            
        }

        task.resume()
        
    }
}
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

