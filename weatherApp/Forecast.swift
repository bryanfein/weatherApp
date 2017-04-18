//
//  Forecast.swift
//  weatherApp
//
//  Created by Bryan Fein on 4/17/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import UIKit
import Alamofire


class Forecast {
    
    // create future forecast variables
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    
    
    //---------
    var date: String {
        
        if _date == nil{
            _date = ""
        }
        return _date
    }
    //---------
    var weatherType: String {
        if _weatherType == nil {
            _date = ""
        }
        return _date
    }
    //---------
    var highTemp : String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    //---------
    var lowTemp : String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    //---------
    
    
    init(weatherDict: Dictionary<String, AnyObject>){
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = weatherDict["min"] as? Double {
                
                //convert kelvin to farenhite
                let kelvinToFarenhitePreDivision = (min * (9/5) - 459.67)
                let kalvinToFarenhite = Double (round (10 * kelvinToFarenhitePreDivision/10))
                
                self._lowTemp = "\(kalvinToFarenhite)"
            }
            
            if let max = weatherDict["max"] as? Double {
                
                let kelvinToFarenhitePreDivision = (max * (9/5) - 459.67)
                let kalvinToFarenhite = Double (round (10 * kelvinToFarenhitePreDivision/10))
                self._highTemp = "\(kalvinToFarenhite)"
                
            }
            
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
    }
}


extension Date {
    func
}









