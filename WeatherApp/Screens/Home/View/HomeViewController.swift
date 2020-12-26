//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import UIKit
import CoreData

class HomeViewController: UIViewController  {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var items : [CityCoreData]?
    
    @IBAction func addCityButton(_ sender: UIBarButtonItem){
        print("Added")

        

        let addCityVC = AddCityViewController(nibName: "AddCityViewController", bundle: nil)
  
        self.navigationController?.pushViewController(addCityVC, animated: true)
        
        
        
    }
    
    @IBOutlet weak var tableView: UITableView! {
        
            didSet {
                self.tableView.dataSource = self
                self.tableView.delegate = self
                self.tableView.tableFooterView = UIView()
                self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
                self.fetchPeople()

               
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        fetchPeople()
    }
    
    
    func fetchPeople(){

           do {
               
           let request  = CityCoreData.fetchRequest() as NSFetchRequest<CityCoreData>
               
             let sort = NSSortDescriptor(key: "name", ascending: true)
              request.sortDescriptors  = [sort]
            
            
            self.items = try context.fetch(request)
      
          
            DispatchQueue.main.async {
                    
                self.tableView.reloadData()
              
                }

        
            
           }catch {
            print("Eror here")
           }
       }
}



extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return cities.count
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView
            .dequeueReusableCell(withIdentifier: "HomeTableViewCell",
                                 for: indexPath) as? HomeTableViewCell
            else { fatalError() }
     
        let city = self.items![indexPath.row]
        tableViewCell.configureCell(withCity: city)
        
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     
    }
    
    
}
