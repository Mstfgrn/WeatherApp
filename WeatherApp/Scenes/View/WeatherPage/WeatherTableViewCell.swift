//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by MstfGrgn on 20.01.2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var daysName: UILabel!
    @IBOutlet weak var weatherMax: UILabel!
    @IBOutlet weak var weatherMin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data: Daily){
        
        daysName.text = "Frrrr"
        weatherMax.text = "\(data.temp?.max)°"
        weatherMin.text = "\(data.temp?.min)°"
    }
    
    func convertDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        return dateFormatter.string(from: date)
    }

}
