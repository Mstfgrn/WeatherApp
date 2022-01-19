//
//  WeatherServiceEndPoint.swift
//  WeatherApp
//
//  Created by MstfGrgn on 19.01.2022.
//

import Foundation
protocol GenericValueProtocol {
    associatedtype Value
    var value: Value { get }
}
enum WeatherServiceEndPoint: GenericValueProtocol{
    typealias Value = String

    var value: String {
        switch self {
        case .base:
            return "https://api.openweathermap.org/data/2.5/onecall?"
        case .latlong(let size1,let size2):
            return "lat=\(size1)&lon=\(size2)&"
        case .exclude(let exclude):
            return "exclude=\(exclude)&"
        case .api(let api):
            return "appid=\(api)"
        }
    }
    case base
    case latlong(Double,Double)
    case exclude(String)
    case api(String)
}

