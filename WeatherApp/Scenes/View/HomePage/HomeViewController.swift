//
//  ViewController.swift
//  WeatherApp
//
//  Created by MstfGrgn on 19.01.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var textFieldApi: UITextField!
    let viewModel = HomeViewModel()
    /*override func viewControllerConfigurations() {
        
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        textTittle()
    }
    
    func textTittle(){
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 29, weight: .bold)]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "weatherPage" {
            let weatherVC = segue.destination as! WeatherViewController
            if let text = textFieldApi.text{
                weatherVC.getApiKey = text
            }
        }
    }
    
}

