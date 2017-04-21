//
//  WeatherVC.swift
//  weatherApp
//
//  Created by Bryan Fein on 4/8/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var currentTempLable: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation! // a variable to store our location
    
    var currentWeather = CurrentWeather()
    var forecastArray = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // how accurate we want the app to pin point our user
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        //Set up your delegate & dataSource to self
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    
    override func viewDidAppear(_ animated: Bool) { //before the view loads it'll run this code
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    
    func locationAuthStatus () {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse { //if we have the user's location
            currentLocation = locationManager.location //saves the user's location
            
            //call our singleton class and have it assigned to the currentLocation coordinates and it will save to the singleton class
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            //print(currentLocation.coordinate.longitude, currentLocation.coordinate.latitude)
            currentWeather.downloadWeatherDetails { //call downloadWeatherDetails function
                self.downloadForeCastData {
                    self.updateMainUI()
                }
            }
        } else {
            locationManager.requestWhenInUseAuthorization() //request the user's location
            locationAuthStatus() // call the function again to save the user's current location
        }
    }
    
    func downloadForeCastData(complete: @escaping DownloadComplete) {
        //downloading weather data for tableview
        
        //        let forecastURL = URL(string: FORCAST_URL)!
        
        Alamofire.request(FORECAST_URL).responseJSON { response in //(enclouser) after we request it, we'll give it a repsonse
            // print(response)
            let result = response.result
            
            if let forecastDict = result.value as? Dictionary<String, AnyObject> {
                if let list = forecastDict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for object in list {
                        //grab the dictionary from online and throw it in a dictionary
                        let forecast = Forecast(weatherDict: object)
                        //append the dictonaries to the array I created
                        self.forecastArray.append(forecast)
//                        print(object)
                        
                    }
                    self.forecastArray.remove(at: 0)
                    self.forecastArray.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            complete()
        }
    }
    
    
    //(3) Required Functions for UITableView | You are setting everything up
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecastArray[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
            
        } else {
            return WeatherCell()
        }
        
    }
    
    
    func updateMainUI() {
        dateLable.text = currentWeather.date
        currentTempLable.text = "\(currentWeather.currentTemp)"
        currentWeatherLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        weatherIcon.image = UIImage(named: currentWeather.weatherType)
    }
}





