//
//  HomeTableViewCell.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/25/20.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.nameLabel.numberOfLines = 1
    }
    func configureCell(withCity City: CityCoreData) {
        self.textLabel?.text = City.name
      
    }
}
