//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by MstfGrgn on 19.01.2022.
//

import UIKit
import CoreLocation

class WeatherViewController: BaseViewController<WeatherViewModel> {
    
    var locationManager = CLLocationManager()
    var currentLoc: CLLocation!
    var wviewModel = WeatherViewModel()
    var delegate : DataResponseInfoProtocol?
    var getApiKey: String?
    
    @IBOutlet weak var apiText: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.permissionFunc()
        }
        if let receivedText: String = getApiKey {
            //apiText.text = receivedText
            //wviewModel.getWeatherData(lat: 0.0 , lon: 0.0, unit: "metric", exclude: "hourly,daily", api: receivedText)
            wviewModel.getWeatherData(lat: 41.015137, lon: 28.979530, unit: "metric", exclude: "current,minutely,hourly,alerts", api: receivedText)
        }
    }
    
    func permissionFunc(){
        locationManager.requestWhenInUseAuthorization()
        
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() == .authorizedAlways) {
            currentLoc = locationManager.location
            
            print(currentLoc.coordinate.latitude)
            print(currentLoc.coordinate.longitude)
        }
    }
}
