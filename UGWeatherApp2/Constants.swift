//
//  Constants.swift
//  UGWeatherApp2
//
//  Created by jmayfield37 on 3/13/17.
//  Copyright © 2017 Joe Mayfield. All rights reserved.
//

import Foundation


let API_KEY = "84af0d0f39c80ebe"

//let full_url = "/forecast/geolookup/conditions/q/CA/San_Francisco.json"
let CURRENT_WEATHER_URL = "http://api.wunderground.com/api/84af0d0f39c80ebe/conditions/q/\(Location.sharedInstance.latitude!),\(Location.sharedInstance.longitude!).json"
//http://api.wunderground.com/api/84af0d0f39c80ebe/conditions/geolookup/q/39.7589,-84.1917.json
let FORECAST_URL = "http://api.wunderground.com/api/84af0d0f39c80ebe/forecast/geolookup/q/\(Location.sharedInstance.latitude!),\(Location.sharedInstance.longitude!).json"
//http://api.wunderground.com/api/84af0d0f39c80ebe/forecast/geolookup/q/39.7589,-84.1917.json
typealias DownloadComplete = () -> ()
