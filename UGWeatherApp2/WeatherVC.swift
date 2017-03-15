//
//  ViewController.swift
//  UGWeatherApp2
//
//  Created by jmayfield37 on 3/13/17.
//  Copyright © 2017 Joe Mayfield. All rights reserved.
//

import UIKit

class WeatherCV: UIViewController {

    @IBOutlet weak var weatherDateLbl: UILabel!
    
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var weatherConditionLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var WeatherIconImg: UIImageView!
    var currentWeather: CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.updateUI()
        }
        
        
        
    }

    func updateUI() {
        print("update ui")
        cityLbl.text = currentWeather.cityName
        
        currentTempLbl.text = "\(currentWeather.currentTemp)\u{00B0}"
        weatherDateLbl.text = currentWeather.date
        
        
        let url = URL(string: currentWeather.weatherIcon)
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.global().sync {
                    self.WeatherIconImg.image = UIImage(data: data)
                }
            } catch  {
                //handle the error
            }
        }
        
    }



}

