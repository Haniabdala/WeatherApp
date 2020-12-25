//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import UIKit

class HomeViewController: UIViewController  {
    

    
    @IBAction func addCityButton(_ sender: UIBarButtonItem){
        print("Added")

        

        let addCityVC = AddCityViewController(nibName: "AddCityViewController", bundle: nil)
  
        self.navigationController?.pushViewController(addCityVC, animated: true)
        
        
        
    }
    
    let testCity = City(name: "Ohio, USA ", temperature: 2, longitude: 3, latitude: 4, windSpeed: 1, windDeg: 2, humidity: 23, icon: "sd")
    
    var cities = [City]()

    @IBOutlet weak var tableView: UITableView! {
        
            didSet {
                self.tableView.dataSource = self
                self.tableView.delegate = self
                self.tableView.tableFooterView = UIView()
                self.tableView.tableFooterView = UIView()
                self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")

               
            }
    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

func addCity() {
    
}


extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return cities.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView
            .dequeueReusableCell(withIdentifier: "HomeTableViewCell",
                                 for: indexPath) as? HomeTableViewCell
            else { fatalError() }
        tableViewCell.configureCell(withCity: testCity)
        
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     
    }
    
    
}
