//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var viewModel = MapViewModel()
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func searchButton(_ sender: UIButton) {
        if let text = searchTextField.text {
            findCoordinates(cityName: text)
        }
    }
    
    @IBOutlet weak var mapView: MKMapView! {
        didSet{
            viewModel.fetchCities()
            let cities = viewModel.cities
            let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(MapViewController.getCoordinatePressOnMap(sender: )))
            gestureRecognizer.numberOfTapsRequired = 1
            mapView.addGestureRecognizer(gestureRecognizer)
            for city in cities {
                generatePins(lat: city.latitude, long: city.longitude)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func getCoordinatePressOnMap(sender: UITapGestureRecognizer) {
        let touchLocation = sender.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        let alert = UIAlertController(title: "Add City", message: "Do you want to add this city? ", preferredStyle: .alert)
        alert.addTextField()
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let submitButton = UIAlertAction(title: "Add ", style: .default) { (action) in
            self.viewModel.addCity(CityName: alert.textFields![0].text ?? "", Latitude: locationCoordinate.latitude, Longitude: locationCoordinate.longitude)
        }
        alert.addAction(submitButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
        showOnMap(lat: locationCoordinate.latitude, long: locationCoordinate.longitude)
    }
    
    func AddCity(CityNamE City : String , Latitude lat: Double, Longitude long: Double ){
        let alert = UIAlertController(title: "Add City", message: "Do you want to add this city ", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let submitButton = UIAlertAction(title: "Add \(City)", style: .default) { (action) in
            self.viewModel.addCity(CityName: City, Latitude: lat, Longitude: long)
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self.AddCity(CityNamE: city , Latitude: location.coordinate.latitude , Longitude: location.coordinate.longitude)
                    }
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

