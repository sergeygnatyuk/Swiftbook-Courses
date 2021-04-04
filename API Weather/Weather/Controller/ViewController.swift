//
//  ViewController.swift
//  Weather
//
//  Created by Гнатюк Сергей on 02.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) {city in
            self.networkWeatherManager.fetchCurrentWeather(fortCity: city)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.delegate = self
        networkWeatherManager.fetchCurrentWeather(fortCity: "London")
        
    }
}

extension ViewController: NetworkWeatherManagerDelegate {
    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
        print(currentWeather.cityName)
    }
    
    
}
