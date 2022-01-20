//
//  DataResponseInfoProtocol.swift
//  WeatherApp
//
//  Created by MstfGrgn on 20.01.2022.
//

import Foundation

protocol DataResponseInfoProtocol{
    func askNumberOfSection() -> Int
    func askNumberOfItem(in section: Int) -> Int
    func askData(at index: Int) -> WeatherDataResponse.Daily?
    func stateInfo() -> Bool
    func selectedItem(at index: Int)
}
extension DataResponseInfoProtocol{
    func selectedItem(at index: Int){}
}

