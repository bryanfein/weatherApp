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
    var _cityName : String!
    var _date : String!
    var _weatherType : String!
    var _currentWeather : Double!
    
    
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
        
        let dateFormater = DateFormatter()
        dateFormater 
        
        return _date
    }
}

