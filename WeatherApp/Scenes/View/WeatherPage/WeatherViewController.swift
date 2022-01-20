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

    @IBOutlet weak var apiText: UILabel!
    var getApiKey: String?
   
    var wviewModel = WeatherViewModel()
    var currentLoc: CLLocation!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    
   
}
