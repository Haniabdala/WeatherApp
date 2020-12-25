//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import UIKit
import MapKit

class AddCityViewController: UIViewController , UISearchBarDelegate{

    @IBOutlet weak var Map: MKMapView!
    
 

    @IBOutlet weak var searchBarText: UISearchBar!{
        
        didSet{
            let searchController = UISearchController(searchResultsController: nil)
            
            searchController.searchBar.delegate = self
            
            present(searchController, animated: true, completion: nil)
        
        }
    }
    

    

 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
       

        // Do any additional setup after loading the view.
    }
    
     func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
       
        
        
    }
    
    func findLoc(CityName : String){
  
        Map.addAnnotation(<#T##annotation: MKAnnotation##MKAnnotation#>)
        
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

