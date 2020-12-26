//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import UIKit
import MapKit

class AddCityViewController: UIViewController {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBAction func searchButton(_ sender: UIButton) {
        
        if let text = searchTextField.text {

            findCoordinates(cityName: text)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    func AddCity(CityNamE City : String){
        
            let alert = UIAlertController(title: "Add City", message: "Do you want to add this city ", preferredStyle: .alert)
    
            let submitButton = UIAlertAction(title: "Add \(City)", style: .default) { (action) in
                
                
                let newCity = CityCoreData(context: self.context)
                newCity.name = City
                newCity.latitude = 23.23
                newCity.longitude = 23.12
                
                do{
                    try  self.context.save()
                }catch{
                    
                }
            }
       
 
            alert.addAction(submitButton)
            
        self.present(alert, animated: true, completion: nil)
            
      
    }
    
    
    
    func showOnMap(lat : Double , long : Double){
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        annotation.coordinate = centerCoordinate
        //annotation.title = "Tesy"
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
       
    }
    
    func findCoordinates(cityName city : String) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = city
        searchRequest.region = mapView.region

        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                // Handle the error.
                return
            }
            
            for item in response.mapItems {
                if let _ = item.name,
                   let location = item.placemark.location {
                 
                    self.showOnMap(lat: location.coordinate.latitude,long : location.coordinate.longitude)
                    self.AddCity(CityNamE: city)
                  //  self.viewModel.fetchPeople()
                }
            }
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

}


