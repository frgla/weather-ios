//
//  ViewController.swift
//  WeatherApp
//
//  Created by Fran Glavota on 25/10/2018.
//  Copyright © 2018 Fran Glavota. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //outlets
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //constants
    let locationManager = CLLocationManager()
    
    
    //variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userLocation()
    }
    
    func updateUI () {
        //print ("\(parsedValues["city"])!")
        DispatchQueue.main.async {
            self.cityLabel.text = "\(parsedValues["city"] ?? "")"
            self.weatherDescriptionLabel.text = "\(parsedValues["description"] ?? "")"
            self.temperatureLabel.text = "\(parsedValues["temperature"] ?? "")"
            self.dateLabel.text = "\(parsedValues["date"] ?? "")"
        }
    }
    
    func userLocation () {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startMonitoringSignificantLocationChanges()
        } else {
            locationManager.requestWhenInUseAuthorization()
            userLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("latitude: \(locValue.latitude) longitude: \(locValue.longitude)")
        
        Location.sharedInstance.latitude = locValue.latitude
        Location.sharedInstance.longitude = locValue.longitude
        
        downloadWeather {
            self.updateUI()
        }
    }

}

