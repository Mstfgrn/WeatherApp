//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by MstfGrgn on 19.01.2022.
//

import Foundation
import Alamofire
import CoreLocation
import SwiftUI

class WeatherViewModel{
    typealias urlEndPoint = WeatherServiceEndPoint
    
    var state: Bool = false
    var responseArr = [Daily]()
    var data2: Dailyy = []
    
    func getWeatherData(lat: Double?, lon: Double?, unit: String, exclude: String, api:String){
        AF.request("\(urlEndPoint.base.value)\(urlEndPoint.latlong(lat!, lon!).value)\(urlEndPoint.exclude(exclude).value)\(urlEndPoint.units(unit).value)\(urlEndPoint.api(api).value)", method: .get).responseJSON { response in
            if let data = response.data{
                do{
                    let backData =  try JSONDecoder().decode(WeatherDataResponse.self, from: data)
                    if let receiveData = backData.daily{
                        self.data2 = receiveData
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ResultData"), object: nil, userInfo: ["arr": self.data2])
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
   /* func getWeatherData(lat: Double?, lon: Double?, unit: String, exclude: String, api:String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        CLGeocoder().geocodeAddressString("") { (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let lat = lat,
               let lon = lon{
                // Don't forget to use your own key
                
                APIService.shared.getJSON(urlString: "\(urlEndPoint.base.value)\(urlEndPoint.latlong(lat, lon).value)\(urlEndPoint.exclude(exclude).value)\(urlEndPoint.units(unit).value)\(urlEndPoint.api(api).value)",
                                   dateDecodingStrategy: .secondsSince1970) { (result: Result<WeatherDataResponse,APIService.APIError>) in
                    switch result {
                    case .success(let weatherDataResponse):
                        self.responseArr = weatherDataResponse.daily
                        print(self.responseArr!)
                        //print(weatherDataResponse.timezone ?? "")
                        for day in weatherDataResponse.daily {
                            
                            /*print(dateFormatter.string(from: day.dt))
                            print("   Max: ", day.temp.max)
                            print("   Min: ", day.temp.min)
                            print("   Humidity: ", day.humidity)
                            print("   Description: ", day.weather[0].description)
                            print("   Clouds: ", day.clouds)
                            print("   pop: ", day.pop)
                            print("   IconURL: ", day.weather[0].weatherIconURL)*/
                        }
                    case .failure(let apiError):
                        switch apiError {
                        case .error(let errorString):
                            self.state = true
                            print(self.state)
                            print(errorString)
                        }
                    }
                }
            }
        }
    }*/

}
/*extension WeatherViewModel: DataResponseInfoProtocol{
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return data2.count
    }
    
    func askData(at index: Int) -> Daily? {
        return data2[index]
    }
    
    func stateInfo() -> Bool {
        return state
    }
    
}
*/

