//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by MstfGrgn on 19.01.2022.
//

import UIKit
class WeatherViewController: BaseViewController<WeatherViewModel> {
 
    @IBOutlet weak var apiText: UILabel!

    var wviewModel = WeatherViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   
}
