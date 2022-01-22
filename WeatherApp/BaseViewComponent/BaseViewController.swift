//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by MstfGrgn on 19.01.2022.
//

import UIKit

open class BaseViewController<V>: UIViewController {
    
    var viewModel: V!
    
    convenience public init(viewModel: V) {
        self.init()
        self.viewModel = viewModel
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerConfigurations()
    }
    
    public func viewControllerConfigurations() {
    }
    
}

