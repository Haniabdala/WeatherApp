//
//  CityDetailTableViewCell.swift
//  WeatherApp
//
//  Created by Hani Abdallah on 12/28/20.
//

import UIKit

class CityDetailTableViewCell: UITableViewCell {

    let model = CityDetailModel()
    
    func configureCell(response : cityDaily , index : IndexPath){
        
     let day = model.genDays(index: index)
        self.textLabel?.text = String("\(day):\(response.temp.day)°")

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
       // super.setSelected(selected, animated: animated)
    }
    
}
