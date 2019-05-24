//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Fran Glavota on 26/10/2018.
//  Copyright © 2018 Fran Glavota. All rights reserved.
//

import Foundation

struct WeatherModel: Decodable {
    let sys: Sys?
    let name: String
    let weather: [Weather]
    let dt: Double
    let main: Main
    let clouds: Clouds
    let id: Int
    let base: String
    let wind: Wind
    let coord: Coord
    let cod: Int
}

struct Clouds: Decodable {
    let all: Int
}

struct Coord: Decodable {
    let lat, lon: Double
}

struct Main: Decodable {
    let humidity: Int
    let tempMin: Double
    let seaLevel: Double?
    let pressure: Double?
    let tempMax: Double
    let grndLevel: Double?
    let temp: Double
    
    enum CodingKeys: String, CodingKey {
        case humidity
        case tempMin = "temp_min"
        case seaLevel = "sea_level"
        case pressure
        case tempMax = "temp_max"
        case grndLevel = "grnd_level"
        case temp
    }
}

struct Sys: Decodable {
    let country: String
    let sunset, sunrise: Int
    let message: Double
}

struct Weather: Decodable {
    let icon, description, main: String
    let id: Int
}

struct Wind: Decodable {
    let deg: Double?
    let speed: Double
}

var parsedValues: [String: Any] = [:]

func downloadWeather (completed: @escaping DownloadComplete) {
    URLSession.shared.dataTask(with: API_URL!) { (data, response, err) in
        
        guard let data = data else { return }
        
        do {
            let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
            let city = weather.name
            
            let temp = weather.main.temp
            let doubleTemperature = (temp - 273.15)
            let temperature = Int(doubleTemperature)
            
            let rawDate = weather.dt
            let convertedDate = Date(timeIntervalSince1970: rawDate)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            let date = dateFormatter.string(from: convertedDate)
            
            let description = weather.weather[0].main
            
            print (city,"\n",
                   temperature,"\n",
                   date,"\n",
                   description)
            parsedValues = ["city": city,
                            "temperature": temperature,
                            "date": date,
                            "description": description]
            
            completed()
        }
        catch let jsonErr {
            print ("Error serializing json: ", jsonErr)
        }
    }
    .resume()
}
