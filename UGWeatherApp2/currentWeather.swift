//
//  currentWeather.swift
//  UGWeatherApp1
//
//  Created by jmayfield37 on 3/13/17.
//  Copyright © 2017 Joe Mayfield. All rights reserved.
//
import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String{
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
        
    }
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var currentTemp: Double{
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    var date: String{
        if _date == nil{
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        //Alamofire download
        
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let main = dict["current_observation"]?["display_location"] as? Dictionary<String, AnyObject> {
                    
                    if let name = main["full"] as? String {
                        self._cityName = name.capitalized
                        print(self._cityName)
                        
                    }
                }
                
                if let main = dict["current_observation"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemperature = main["temp_f"] as? Double {
                        
                        self._currentTemp = currentTemperature
                        print(self._currentTemp)
                    }
                }
                if let main = dict["current_observation"] as? Dictionary<String, AnyObject> {
                    
                    if let weatherType = main["weather"] as? String {
                        
                        self._weatherType = weatherType
                        print(self._weatherType)
                    }
                }
            }
            completed()
        }
    }
}


