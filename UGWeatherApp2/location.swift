//
//  location.swift
//  UGWeatherApp2
//
//  Created by jmayfield37 on 3/16/17.
//  Copyright © 2017 Joe Mayfield. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
