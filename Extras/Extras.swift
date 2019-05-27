//
//  Extras.swift
//  WeatherApp
//
//  Created by Fran Glavota on 29/10/2018.
//  Copyright © 2018 Fran Glavota. All rights reserved.
//

import Foundation


let API_URL = URL (string: "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=129ada8d2a304cb801691437cf896942")
//let FORECAST_API_URL = URL(string: "http://api.openweathermap.org/data/2.5/forecast?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=129ada8d2a304cb801691437cf896942")

let FORECAST_API_URL = URL(string: "https://api.darksky.net/forecast/6dcdd4ac785c81f86ae2f3d9d232fd55/\(Location.sharedInstance.latitude!),\(Location.sharedInstance.longitude!)?units=si")
typealias DownloadComplete = () -> ()
