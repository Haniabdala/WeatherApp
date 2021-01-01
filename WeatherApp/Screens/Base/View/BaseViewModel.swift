//
//  BaseViewModel.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import UIKit

class BaseViewModel: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.title = "Weather App"
        addTabBarItems()
    }
    
    func addTabBarItems(){
        let firstViewController = HomeViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        let secondViewController = HelpViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Help", image: UIImage(named: "help"), tag: 1)
        let tabBarList = [firstViewController,secondViewController]
        self.viewControllers = tabBarList
    }
}
