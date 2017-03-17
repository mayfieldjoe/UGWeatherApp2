//
//  Forecast.swift
//  UGWeatherApp2
//
//  Created by jmayfield37 on 3/16/17.
//  Copyright © 2017 Joe Mayfield. All rights reserved.
//

import Foundation
import Alamofire

class Forecast {
    var _weatherIcon: String!
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var weatherIcon: String{
        if _weatherIcon == nil {
            _weatherIcon = ""
        }
        return _weatherIcon
    }
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, Any>) {
        if let low = weatherDict["low"] as? Dictionary<String, Any> {
            if let min = low["fahrenheit"] as? String {
                self._lowTemp = "\(min)"
                print(self._lowTemp)
            }
        }
        if let high = weatherDict["high"] as? Dictionary<String, Any> {
            if let max = high["fahrenheit"] as? String {
                self._highTemp = "\(max)"
                print(self._highTemp)
            }
        }
        if let conditions = weatherDict["conditions"] as? String{
            let weatherCondition = conditions
              self._weatherType = weatherCondition
                print(self._weatherType)
            
        }
        if let date = weatherDict["date"] as? Dictionary<String, Any> {
            if let weekDay = date["weekday"] as? String {
                self._date = "\(weekDay)"
                print(self._date)
            }
        }
        if let Icon_url = weatherDict["icon_url"] as? String{
            let weatherImg = Icon_url
            self._weatherIcon = "\(weatherImg)"
            print(self._weatherIcon)
            
        }
    }
    
}

//extension Date {
//    func dayOfTheWeek() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEEE"
//        return dateFormatter.string(from: self)
//    }
//}
