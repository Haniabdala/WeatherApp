//
//  HelpViewController.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var helpTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helpTextView.text = "In Home Page , you can view the cities bookmarked, also using the add button you can access the map which allow you to add more cities to your home page, or you can delete all your bookmarked cities by using the reset button.                                                                                                      You can add cities by either searching them or by tapping on a specific location of the map.                                                                                                                                                                         You can also delete a specific bookmarked city by swiping the specific cell to the left.                                                                                   Your bookmarks will be showed every time you open the map until you delete them.                                                                                                All your bookmarked cities will be stored locally on your device.                                                                                                               In each city detail and forecast page you can choose a specific temperature unit, by toogling the switch between metric(°C) and imperial(°F)."
    }
}
