//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import UIKit
import CoreData

class HomeViewController: UIViewController  {

    var viewModel = HomeViewModel()
    var searched = [CityCoreData]()
    var searching = false
    
    @IBOutlet weak var citySearchBar: UISearchBar! {
        didSet{
            self.citySearchBar.delegate = self
        }
    }
    
    
    @IBAction func resetCitiesButton(_ sender: UIBarButtonItem) {
        
                   let alert = UIAlertController(title: "Reset Cities", message: "Do you want to remove all bookmarked Cities", preferredStyle: .alert)
                   let cancelButton = UIAlertAction(title: "No", style: .cancel, handler: nil)
                   let submitButton = UIAlertAction(title: "Yes", style: .default) { (action) in
                    self.viewModel.resetCities()
                    self.reloadTableViewContent()
                
                   }
                   alert.addAction(submitButton)
                   alert.addAction(cancelButton)
               self.present(alert, animated: true, completion: nil)
 
    }
    

    
    @IBAction func addCityButton(_ sender: UIBarButtonItem){
        let addCityVC = MapViewController(nibName: "MapViewController", bundle: nil)
        self.navigationController?.pushViewController(addCityVC, animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView! {
        
            didSet {
                self.tableView.dataSource = self
                self.tableView.delegate = self
                self.tableView.tableFooterView = UIView()
                self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchCities()
        reloadTableViewContent()
    }
}

extension HomeViewController : UITableViewDelegate , UITableViewDataSource , HomeViewControllerProtocol {
    func reloadTableViewContent() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
          
            }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(searching)

        if self.searching {
            return self.searched.count
        }else{
            return self.viewModel.items?.count ?? 0
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView
            .dequeueReusableCell(withIdentifier: "HomeTableViewCell",
                                 for: indexPath) as? HomeTableViewCell
            else { fatalError() }
       // print(searching)
  
        if self.searching {
                let city = self.searched[indexPath.row]
                tableViewCell.configureCell(withCity: city)
        }else {
                let city = viewModel.items![indexPath.row]
                tableViewCell.configureCell(withCity: city)
            }
    
     
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let CityDetailVC = CityDetailViewController(nibName: "CityDetailViewController", bundle: nil)
        if searching {
            let cell = searched[indexPath.row]
     
            CityDetailVC.cityName = (cell.name)!
            CityDetailVC.cityLatitude = (cell.latitude)
            CityDetailVC.cityLongitude = (cell.longitude)
        }else {
            let cell = viewModel.items![indexPath.row]
            CityDetailVC.cityName = (cell.name)!
            CityDetailVC.cityLatitude = (cell.latitude)
            CityDetailVC.cityLongitude = (cell.longitude)
        }
    
      

        self.navigationController?.pushViewController(CityDetailVC, animated: true)
       
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //Create Swipe action
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
        
            let city = self.viewModel.items![indexPath.row]
            self.viewModel.deleteCity(CityName: city)
            self.reloadTableViewContent()
        }
   
        return UISwipeActionsConfiguration(actions: [action])
     
    }
    
    
 
    
}

extension HomeViewController :UISearchBarDelegate {
    
      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          print(searchText.count)
          if searchText.count != 0 {
             
              self.searched = viewModel.items!.filter({ (CityCoreData) -> Bool in
                  searching = true
                
                  if( CityCoreData.name!.contains(searchText)){
                      return true
              
                  }
                  return false
              })
          }else {
              self.searching = false
          }
       

             
      
      
          reloadTableViewContent()
          }
}

 
      
    

