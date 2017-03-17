//
//  WeatherCell.swift
//  UGWeatherApp2
//
//  Created by jmayfield37 on 3/16/17.
//  Copyright © 2017 Joe Mayfield. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        lowTemp.text = "\(forecast.lowTemp)\u{00B0}"
        //print("\(forecast.lowTemp)")
        highTemp.text = "\(forecast.highTemp)\u{00B0}"
        weatherType.text = forecast.weatherType
        //weatherIcon.image = UIImage(forecast.weatherIcon)
        dayLabel.text = forecast.date
        
        let url = URL(string: forecast.weatherIcon)!
       
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.weatherIcon.image = UIImage(data: data)
                    print("\(data)")
                }
            } catch  {
                //handle the error
            }
        }
    
    }
}
