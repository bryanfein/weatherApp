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
    private var _currentWeather : Double!
    
    
    
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
    var currentWeather : Double {
        if _currentWeather == nil{
            _currentWeather = 0.0
        }
        return _currentWeather
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
    
    
    func downloadWeatherDetails(completed : DownloadComplete) {
        // Alamofire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        //start Alamofire - passing in the URL and we want the results to come in Json format
        Alamofire.request(currentWeatherURL).responseJSON { response in //(enclouser) after we request it, we'll give it a repsonse
            let result = response.result
            print(response)
            
        }
        completed() //call compeleted method
    }
}

