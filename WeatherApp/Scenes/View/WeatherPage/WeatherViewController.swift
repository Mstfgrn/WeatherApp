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
    //var delegate: DataResponseInfoProtocol?
    var wviewModel = WeatherViewModel()
    var getApiKey: String?
    var resultgetdata: Dailyy = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var apiText: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //self.delegate = viewModel
        NotificationCenter.default.addObserver(self, selector: #selector(getData(data:)), name: NSNotification.Name.init(rawValue: "ResultData"), object: nil)
        DispatchQueue.main.async {
            self.permissionFunc()
        }
        if let receivedText: String = getApiKey {
            //apiText.text = receivedText
            //wviewModel.getWeatherData(lat: 0.0 , lon: 0.0, unit: "metric", exclude: "hourly,daily", api: receivedText)
            wviewModel.getWeatherData(lat: 41.015137, lon: 28.979530, unit: "metric", exclude: "current,minutely,hourly,alerts", api: receivedText)
        }
    }
    
    @objc func getData(data: Notification){
        if let data = data.userInfo{
            let result = data["arr"] as! [Daily]
            self.resultgetdata = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
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
    func numberOfSections(in tableView: UITableView) -> Int {
        //return delegate?.askNumberOfSection() ?? 0
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return delegate?.askNumberOfItem(in: section) ?? 5
        return self.resultgetdata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = self.resultgetdata[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherTableViewCell
        //print(data)
        //cell.daysName.text = "\(data.dt!)"
        //cell.configure(data: resultgetdata)
        //cell.weatherMax.text = "istanbul"
        //cell.weatherMin.text = "1"
        cell.configure(data: data)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
