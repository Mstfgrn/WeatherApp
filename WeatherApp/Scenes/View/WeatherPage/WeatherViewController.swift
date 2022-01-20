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
    var resultgetdata = [Daily]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var apiText: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //self.delegate = wviewModel
        NotificationCenter.default.addObserver(self, selector: #selector(getData(data:)), name: NSNotification.Name.init(rawValue: "ResultData"), object: nil)
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
    @objc func getData(data: Notification){
        if let data = data.userInfo{
            let result = data["arr"] as! [Daily]
            self.resultgetdata = result
            
            for day in resultgetdata {
                print("   Max: ", day.temp!.max)
                print("   Min: ", day.temp!.min)
               // print("   IconURL: ", day.weather[0].weatherIconURL)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return delegate?.askNumberOfItem(in: section) ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let sepet = resultgetdata[indexPath.row]
        //guard let resultData = delegate?.askData(at: indexPath.row) else{return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherTableViewCell
        
        //cell.daysName.text = "\(resultData.dt)"
        //cell.configure(data: resultgetdata)
        //cell.weatherMax.text = "istanbul"
        //cell.weatherMin.text = "1"
        //cell.configure(data: sepet)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
