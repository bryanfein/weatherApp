//
//  CurrentWeather.swift
//  weatherApp
//
//  Created by Bryan Fein on 4/10/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWeather {
    private var _cityName : String!
    private var _date : String!
    private var _weatherType : String!
    private var _currentTemp : Double!
    
    
    
    //to ensure your code is safe
    
    var cityName : String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    //------
    var weatherType : String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    //-------
    var currentTemp : Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    //------
    
    var date : String {
        if _date == nil{
            _date = ""
        }
        // declare your dateFormatter and how it looks
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        // a constant that gets the date and we are using dateFormatter to formate the date
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    // downloading Json from API
    
    func downloadWeatherDetails(completed : @escaping DownloadComplete) {
        // Alamofire download
//        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        //start Alamofire - passing in the URL and we want the results to come in Json format
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in //(enclouser) after we request it, we'll give it a repsonse
            let result = response.result
            
            if let weatherDictionary = result.value as? Dictionary<String, AnyObject> {
                
                if let name = weatherDictionary["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                
                if let weather = weatherDictionary["weather"] as? [Dictionary<String, AnyObject>] // Array within a Dictionary
                {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = weatherDictionary["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperture = main["temp"] as? Double {
                        
                        //convert kelvin to farenhite
                        let kelvinToFarenhitePreDivision = (currentTemperture * (9/5) - 459.67)
                        
                        let kalvinToFarenhite = Double (round (10 * kelvinToFarenhitePreDivision/10))
                        
                        self._currentTemp = kalvinToFarenhite
                        print(self._currentTemp)
                    }
                }
            }
            completed() //call compeleted method
            
        }
    }
}

