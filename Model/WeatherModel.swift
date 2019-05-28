//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Fran Glavota on 26/10/2018.
//  Copyright © 2018 Fran Glavota. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct WeatherModel {
    var cityName: String
    var summary: String
    var temperature: Int
    var date: String?
    
    var dailyForecastArray: [DailyWeatherModel] = []
    init(with name: String, and currentWeather: JSON) {
        cityName = name
        summary = currentWeather["currently"]["summary"].stringValue
        temperature = currentWeather["currently"]["temperature"].intValue
        date = convertTimestampToDate(timestamp: currentWeather["currently"]["time"].intValue)
        
        for daily in currentWeather["daily"]["data"].arrayValue {
            let dailyForecast: DailyWeatherModel = DailyWeatherModel(json: daily)
            dailyForecastArray.append(dailyForecast)
        }
    }
    
    func convertTimestampToDate(timestamp: Int) -> String {
        let convertedDate = Date(timeIntervalSince1970: Double(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: convertedDate)
    }
}

