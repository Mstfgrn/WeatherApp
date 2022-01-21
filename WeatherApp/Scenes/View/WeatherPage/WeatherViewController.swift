//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by MstfGrgn on 19.01.2022.
//

import UIKit
import CoreLocation

class WeatherViewController: BaseViewController<WeatherViewModel> {
    
    //var delegate: DataResponseInfoProtocol?
    
    var wviewModel = WeatherViewModel()
    var getApiKey: String?
    var resultgetdata: Dailyy = []
    var lat: Double!
    var lon: Double!

    
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var currentDegrees: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var apiText: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //self.delegate = viewModel
        findLocation()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if let receivedText: String = getApiKey, let latt: Double = lat, let lonn: Double = lon{
            
            wviewModel.getWeatherData(lat: latt, lon: lonn, unit: "metric", exclude: "current,minutely,hourly,alerts", api: receivedText)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(getData(data:)), name: NSNotification.Name.init(rawValue: "ResultData"), object: nil)
    }
    
    @objc func getData(data: Notification){
        if let data = data.userInfo{
            let result = data["arr"] as! [Daily]
            self.resultgetdata = result
            imageMain.load(url: URL(string: WeatherServiceEndPoint.imageUrl(resultgetdata[0].weather![0].icon!).value)!)
            currentDegrees.text = "\(String(describing: resultgetdata[0].temp!.day!))°"
            
                self.tableView.reloadData()
            
        }
    }
    
    public func findLocation(){
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: self.lat, longitude: self.lon) // <- New York
        print(self.lat!)
        print(self.lon!)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, _) -> Void in

            placemarks?.forEach { (placemark) in

                if let city = placemark.locality {
                    self.apiText.text = city
                    print(city)
                } // Prints San Francisco Because my emulator location is that
            }
        })
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
        
        cell.configure(data: data)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
