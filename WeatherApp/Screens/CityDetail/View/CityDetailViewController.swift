//
//  CityDetailViewController.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/26/20.
//
import Foundation
import UIKit

class CityDetailViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
   
    let viewModel = CityDetailViewModel()
    
    @IBOutlet weak var unitSegment: UISegmentedControl!
    var cityName : String = ""
    var cityLatitude : Double = 0.0
    var  cityLongitude : Double = 0.0
  //  var resp = Response(lat: 0, lon: 0, current: 0, daily: cityDaily(pressure: 0, temp: CityDailytemperature(day: 2.0)))
    
    //var resp = Response(lat: 0, lon: 0, current: City(temp: 0, pressure: 0, humidity: 0, weather : We;
    
    var resp = Response(lat: 0, lon: 0, current: City(temp: 0, pressure: 0, humidity: 0, weather: []), daily: [])

    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var weatherSatusLabel: UILabel!
    
    @IBOutlet weak var CityTempLabel: UILabel!
    
    
    @IBOutlet weak var forecastTableView: UITableView!   {
        didSet {

    self.forecastTableView.dataSource = self
    self.forecastTableView.delegate = self
    self.forecastTableView.tableFooterView = UIView()
    self.forecastTableView.register(CityDetailTableViewCell.self, forCellReuseIdentifier: "CityDetailTableViewCell")
}
}
 

    @IBAction func segmentDidChange(_ sender : UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            
            let urlData = APISettings.getWeatheraApiRequestUrl(lat: cityLatitude, long: cityLongitude, unit: "metric")
            
            guard  let urlString = URL(string: urlData) else {
                fatalError()
            }
            
            
            viewModel.getCurrentWeatherData(externalUrl: urlString) { res in
                
                self.updateCityDetailView(responseResult: res)
              
      
            
            }
            
        } else if sender.selectedSegmentIndex == 1 {
            let urlData = APISettings.getWeatheraApiRequestUrl(lat: cityLatitude, long: cityLongitude, unit: "imperial")
            
            guard  let urlString = URL(string: urlData) else {
                fatalError()
            }
            
            
            viewModel.getCurrentWeatherData(externalUrl: urlString) { res in
                
                self.updateCityDetailView(responseResult: res)
              
      
            
            }
        }
        
    }
   // let unit = SettingsViewController.getUnit()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
     
        let urlData = APISettings.getWeatheraApiRequestUrl(lat: cityLatitude, long: cityLongitude, unit: "metric")
        
        guard  let urlString = URL(string: urlData) else {
            fatalError()
        }
        
        
        viewModel.getCurrentWeatherData(externalUrl: urlString) { res in
            
            self.updateCityDetailView(responseResult: res)
          
  
        
        }
   
      
    }

    

    func updateCityDetailView(responseResult : Response){
        
        DispatchQueue.main.async {
            self.cityNameLabel.text = self.cityName
            self.CityTempLabel.text = String( "\(Int(responseResult.current.temp))°")
            self.weatherSatusLabel.text = String("\(responseResult.current.weather[0].main)")
            self.resp = responseResult

            self.forecastTableView.reloadData()
        
        }

        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
 
        return resp.daily.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let CityDetailtableViewCell = tableView
            .dequeueReusableCell(withIdentifier: "CityDetailTableViewCell",
                                 for: indexPath) as? CityDetailTableViewCell
            else { fatalError() }

        
       let Dailycity = resp.daily[indexPath.row]
        
        CityDetailtableViewCell.configureCell(response:Dailycity , index: indexPath)
      
        
        return CityDetailtableViewCell
    }
            
           
}


    
    

