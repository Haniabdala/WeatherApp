//
//  CityDetailViewController.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/26/20.
//

import UIKit

class CityDetailViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!
    
    
    let viewModel = CityDetailViewModel()
    
    var cityName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urldata =  APISettings.getcurrentWeatherUrl(forCity: cityName)
  
        guard  let urlString = URL(string: urldata) else {
            fatalError()
        }
    
        viewModel.getCurrentWeatherData(externalUrl: urlString) { res in
            
            self.updateCityDetailView(responseResult: res)
        
        }
    }
    
    func updateCityDetailView(responseResult : Response){
        
        DispatchQueue.main.async {
           self.cityNameLabel.text = responseResult.name
            self.temperatureLabel.text = String( "\(responseResult.main.temp) C")
            self.humidityLabel.text = String(responseResult.main.humidity)
    
       }
    }
}
