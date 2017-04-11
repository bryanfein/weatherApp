//
//  Constants.swift
//  weatherApp
//
//  Created by Bryan Fein on 4/10/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import Foundation



let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "846087a71a59afaccdd7a0d677026fc8"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)37\(LONGITUDE)123\(APP_ID)\(API_KEY)"

