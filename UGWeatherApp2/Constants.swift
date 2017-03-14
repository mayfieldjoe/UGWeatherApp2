//
//  Constants.swift
//  UGWeatherApp2
//
//  Created by jmayfield37 on 3/13/17.
//  Copyright © 2017 Joe Mayfield. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.wunderground.com/api/"
let FORECAST_BASE_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat=39.7589"
let LONGITUDE = "&lon=-84.1917"
let JSON_END = ".json"
let FORECAST = "/forecast/geolookup/conditions/q/.json"
let API_KEY = "84af0d0f39c80ebe"
let LOCATION = "CA/San_Francisco"
//let full_url = "/forecast/geolookup/conditions/q/CA/San_Francisco.json"
let CURRENT_WEATHER_URL = "http://api.wunderground.com/api/84af0d0f39c80ebe/conditions/q/Dayton,TN.json"



typealias DownloadComplete = () -> ()
