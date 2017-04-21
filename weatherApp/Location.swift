//
//  Location.swift
//  weatherApp
//
//  Created by Bryan Fein on 4/21/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import CoreLocation

//Singleton Class

class Location {
    
    static var sharedInstance = Location()
    private init() {}
    
    var latitude : Double!
    var longitude : Double!
    
    
}
