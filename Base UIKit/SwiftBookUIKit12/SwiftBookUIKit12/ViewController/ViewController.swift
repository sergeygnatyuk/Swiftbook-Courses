//
//  ViewController.swift
//  SwiftBookUIKit12
//
//  Created by Гнатюк Сергей on 01.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPresetation()
    }

    func startPresetation() {
        
        let userDefaults = UserDefaults.standard
        let presentationWasViewed = userDefaults.bool(forKey: "presentationWasViewed")
        if presentationWasViewed == false {
            if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? PageViewController {
            
            present(pageViewController, animated: true, completion: nil)
            }   
        }
    }
}
