//
//  BaseViewModel.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import UIKit

class BaseViewModel: UITabBarController, UITabBarControllerDelegate {

    var viewModel = HomeViewController()
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.title = "Weather App"
        
        let firstViewController = HomeViewController()
                
        firstViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)

        let secondViewController = HelpViewController()

        secondViewController.tabBarItem = UITabBarItem(title: "Help", image: UIImage(named: "help"), tag: 1)
        let thirdViewController = SettingsViewController()
        
      
        thirdViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: 2)
        
      let tabBarList = [firstViewController,secondViewController,thirdViewController]
        
     
        
        

        self.viewControllers = tabBarList
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
