//
//  ViewController.swift
//  WeatherApp
//
//  Created by MstfGrgn on 19.01.2022.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var textFieldApi: UITextField!
    
    var locationManager = CLLocationManager()
    let viewModel = HomeViewModel()
    var currentLoc: CLLocation!
    
    public var lat: Double = 0
    public var lon: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        textTittle()
        permissionFunc()
    }
    
    func textTittle(){
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 29, weight: .bold)]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        permissionFunc()
        if segue.identifier == "weatherPage" {
            let weatherVC = segue.destination as! WeatherViewController
            if let text = textFieldApi.text, let lat = lat as? Double, let lon = lon as? Double{
                weatherVC.getApiKey = text
                weatherVC.lat = lat
                weatherVC.lon = lon
                print(lat)
                print(lon)
                
            }
        }
    }
    public func permissionFunc(){
        locationManager.requestWhenInUseAuthorization()
        
        if(locationManager.authorizationStatus == .authorizedWhenInUse ||
           locationManager.authorizationStatus == .authorizedAlways) {
            
            currentLoc = locationManager.location
            lat = currentLoc.coordinate.latitude
            lon = currentLoc.coordinate.longitude
        }
    }
    
}

