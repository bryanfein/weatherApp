//
//  WeatherVC.swift
//  weatherApp
//
//  Created by Bryan Fein on 4/8/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var currentTempLable: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up your delegate & dataSource to self
        tableView.delegate = self
        tableView.dataSource = self
        
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
}

