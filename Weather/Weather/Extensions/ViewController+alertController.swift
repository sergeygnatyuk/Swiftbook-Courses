//
//  ViewController.swift
//  Weather
//
//  Created by Гнатюк Сергей on 02.04.2021.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?,
                                      style: UIAlertController.Style,
                                      completionHandler: @escaping (String) -> Void ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { textField in
            let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
            textField.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { _ in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            if !cityName.isEmpty {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}

