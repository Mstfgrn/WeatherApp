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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var apiText: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DispatchQueue.main.async {
            self.permissionFunc()
            self.tableView.reloadData()


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
extension WeatherViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return delegate?.askNumberOfItem(in: section) ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let resultData = delegate?.askData(at: indexPath.row) else{return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherTableViewCell
        //print(resultData)
        //cell.daysName.text = "pazartesi"
        //cell.weatherMax.text = "22"
        //cell.weatherMin.text = "1"
        cell.configure(data: resultData)
        return cell
    }
    
}
