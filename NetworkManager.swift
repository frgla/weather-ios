//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Gauss on 28/05/2019.
//  Copyright © 2019 Fran Glavota. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    static func downloadWeather (completed: @escaping((WeatherModel) -> Void)) {
        Alamofire.request(GEO_API_URL!).responseJSON { (response) in
            let result = response.result
            let json = JSON(result.value ?? "Error serializing JSON")
            
            let city = json["results"][0]["components"]["city"].stringValue
            
            
            Alamofire.request(FORECAST_API_URL!).responseJSON { (response) in
                let result = response.result
                let json = JSON(result.value ?? "Error serializing JSON")
                
                let model: WeatherModel = WeatherModel (with: city, and: json)
                completed(model)
            }
        }
    }
}
