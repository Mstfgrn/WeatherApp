//
//  WeatherDataResponse.swift
//  WeatherApp
//
//  Created by MstfGrgn on 19.01.2022.
//

import Foundation

struct WeatherDataResponse: Codable {
    let timezone: String?
    struct Daily: Codable {
        let dt: Date
        struct Temp: Codable {
            let max: Double
            let min: Double
        }
        let temp: Temp
        let humidity: Int
        struct Weather: Codable {
            let id: Int
            let description: String
            let icon: String
            var weatherIconURL: URL {
                //WeatherServiceEndPoint.imageUrl(icon).value
                let urlString = WeatherServiceEndPoint.imageUrl(icon).value
                return URL(string: urlString)!
            }
        }
        let weather: [Weather]
        let clouds: Int
        let pop: Double
    }
    let daily: [Daily]
}
