//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    let viewModel = MapViewModel()
 
    
    @IBOutlet weak var mapView: MKMapView! {
        didSet{
            
            let items = viewModel.fetchCities()
            print(items)
            for city in items {
               
                generatePins(lat: city.latitude, long: city.longitude)
            
                
            }
            
            
        }
    }
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBAction func searchButton(_ sender: UIButton) {
        
        if let text = searchTextField.text {

            findCoordinates(cityName: text)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func AddCity(CityNamE City : String , Latitude lat: Double, Longitude long: Double ){
        
            let alert = UIAlertController(title: "Add City", message: "Do you want to add this city ", preferredStyle: .alert)
    
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let submitButton = UIAlertAction(title: "Add \(City)", style: .default) { (action) in
                        
            self.viewModel.inserCity(CityName: City, Latitude: lat, Longitude: long)

            }
       
            alert.addAction(submitButton)
            alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
           
    }
    
    func showOnMap(lat : Double , long : Double){
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        annotation.coordinate = centerCoordinate
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
                return
            }
            
            for item in response.mapItems {
                if let _ = item.name,
                   let location = item.placemark.location {
                 
                    self.showOnMap(lat: location.coordinate.latitude,long : location.coordinate.longitude)
                    self.AddCity(CityNamE: city , Latitude: location.coordinate.latitude , Longitude: location.coordinate.longitude)
                }
            }
        }
    }
    

    
    func generatePins(lat : Double , long : Double){
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        annotation.coordinate = centerCoordinate
        mapView.addAnnotation(annotation)
    }


}


