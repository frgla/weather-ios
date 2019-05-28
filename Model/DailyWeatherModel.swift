//
//  DailyWeatherModel.swift
//  WeatherApp
//
//  Created by Gauss on 28/05/2019.
//  Copyright © 2019 Fran Glavota. All rights reserved.
//

import UIKit
import SwiftyJSON

struct DailyWeatherModel {
    var day: String?
    var summary: String
    var icon: String
    var tempLow: Int
    var tempHigh: Int
    
    init(json: JSON){
        let convertedDate = Date(timeIntervalSince1970: json["time"].doubleValue)
        let index = Calendar.current.component(.weekday, from: convertedDate)
        day = Calendar.current.weekdaySymbols[index - 1]
        summary = json["summary"].stringValue
        icon = json["icon"].stringValue
        tempLow = json["temperatureLow"].intValue
        tempHigh = json["temperatureHigh"].intValue
    }
}

