//
//  SingleTableViewCell.swift
//  WeatherApp
//
//  Created by Gauss on 28/05/2019.
//  Copyright © 2019 Fran Glavota. All rights reserved.
//

import UIKit

class SingleTableViewCell: UITableViewCell {

    @IBOutlet weak var dayOfTheWeek: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    final func config (with data: DailyWeatherModel) {
        dayOfTheWeek.text = data.day
        tempMinLabel.text = String(data.tempLow)
        tempMaxLabel.text = String(data.tempHigh)
        weatherIconImage.image = UIImage(named: data.icon)
        summaryLabel.text = data.summary
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
