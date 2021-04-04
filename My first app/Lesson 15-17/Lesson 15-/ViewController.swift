//
//  ViewController.swift
//  Lesson 15-
//
//  Created by Гнатюк Сергей on 07.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cenliusLabel: UILabel!
    
    @IBOutlet weak var fathrenheitLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 0
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let temperatureCelsius = Int(round(sender.value))
        cenliusLabel.text = "\(temperatureCelsius)ºC"
        let fahrenheitTemperature = Int(round(sender.value * 9 / 5) + 32)
        fathrenheitLabel.text = "\(fahrenheitTemperature)ºF"
    }
}

