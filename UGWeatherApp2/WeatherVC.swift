//
//  ViewController.swift
//  UGWeatherApp2
//
//  Created by jmayfield37 on 3/13/17.
//  Copyright © 2017 Joe Mayfield. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
class WeatherCV: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var searchTxtFld: UITextField!
    @IBOutlet weak var weatherDateLbl: UILabel!
    
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weatherConditionLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var WeatherIconImg: UIImageView!
    var currentWeather: CurrentWeather!
    
    var forecast: Forecast!
    var forecasts = [Forecast]()
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        currentWeather = CurrentWeather()
//        currentWeather.downloadWeatherDetails {
//            self.downloadForecastData {
//                self.updateUI()
//            }
//        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            print(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude)
            currentWeather.downloadWeatherDetails {
                self.downloadForecastData {
                    self.updateUI()
                }
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }


    func updateUI() {
        
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

    



    
    func downloadForecastData(completed: @escaping DownloadComplete){
        // downloading forecast
        print("downloading forecast")
        //let forecastWeatherURL = URL(string: FORECAST)!
        
        Alamofire.request(FORECAST_URL).responseJSON { response in
            
            let result = response.result
            print(response)
            
            if let dict = result.value as? Dictionary<String, Any>{
                if let forecast = dict["forecast"] as? Dictionary<String, AnyObject> {
                    if let simpleforecast = forecast["simpleforecast"] as? Dictionary<String, Any> {
                        if let forecastday = simpleforecast["forecastday"] as? [Dictionary<String, Any>]{
                            
                            for obj in forecastday {
                                let forecastData = Forecast(weatherDict: obj)
                                self.forecasts.append(forecastData)
                                
                                //print(obj)
                            }
                            self.tableView.reloadData()
                        }

                    }
                }
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherCell()
        }
    }


}
