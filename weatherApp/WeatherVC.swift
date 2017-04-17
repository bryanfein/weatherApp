//
//  WeatherVC.swift
//  weatherApp
//
//  Created by Bryan Fein on 4/8/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var currentTempLable: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up your delegate & dataSource to self
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather.downloadWeatherDetails { //call downloadWeatherDetails function
            self.updateMainUI()
        }
        
        
    }
    
    //(3) Required Functions for UITableView | You are setting everything up
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    func updateMainUI() {
        dateLable.text = currentWeather.date
        
        currentTempLable.text = "\(currentWeather.currentWeather)"
        //print(currentWeather.currentWeather)
        
        currentWeatherLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        weatherIcon.image = UIImage(named: currentWeather.weatherType)
    }
}

