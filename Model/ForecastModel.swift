//
//  ForecastModel.swift
//  WeatherApp
//
//  Created by Gauss on 27/05/2019.
//  Copyright © 2019 Fran Glavota. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
struct forecastItem {
    var day: String
    var summary: String
    var icon: String
    var tempLow: Int
    var tempHigh: Int
    
}
var data = [forecastItem]()

func downloadForecast(completed: @escaping DownloadComplete) {
    Alamofire.request(FORECAST_API_URL!).responseJSON { (response) in
        let result = response.result
        let json = JSON(result.value ?? "Eror serializing JSON")
        
        for item in json["daily"]["data"].arrayValue {
            let summary = item["summary"].stringValue
            let tempLow = Int(item["temperatureLow"].doubleValue)
            let tempHigh = Int(item["temperatureHigh"].doubleValue)
            let timestamp = item["time"].doubleValue
            let day = convertTimestamp(timestamp: timestamp)
            let icon = item["icon"].stringValue
            let indexData = forecastItem(day: day, summary: summary, icon: icon, tempLow: tempLow, tempHigh: tempHigh)
            data.append(indexData)
        }
        print (data)
    }
}

func convertTimestamp(timestamp: Double) -> String {
    let convertedDate = Date(timeIntervalSince1970: timestamp)
    let index = Calendar.current.component(.weekday, from: convertedDate)
    let weekday = Calendar.current.weekdaySymbols[index - 1]
    return weekday
}
