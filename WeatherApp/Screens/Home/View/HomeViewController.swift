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
        return self.viewModel.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView
            .dequeueReusableCell(withIdentifier: "HomeTableViewCell",
                                 for: indexPath) as? HomeTableViewCell
            else { fatalError() }
        let city = viewModel.items![indexPath.row]
        tableViewCell.configureCell(withCity: city)
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let CityDetailVC = CityDetailViewController(nibName: "CityDetailViewController", bundle: nil)
        let cell = viewModel.items![indexPath.row]
        CityDetailVC.cityName = (cell.name)!
        CityDetailVC.cityLatitude = (cell.latitude)
        CityDetailVC.cityLongitude = (cell.longitude)

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
