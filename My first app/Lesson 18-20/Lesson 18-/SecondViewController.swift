//
//  SecondViewController.swift
//  Lesson 18-
//
//  Created by Гнатюк Сергей on 09.03.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var login: String?

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = self.login else { return }
        label.text = "Hello, \(login)!"
    }
    
    @IBAction func goBackTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
}
