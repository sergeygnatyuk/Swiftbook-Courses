//
//  ViewController.swift
//  Lesson 10-
//
//  Created by Гнатюк Сергей on 07.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
  
    @IBOutlet var labelCollection: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        label.text = "Hello label"
    }
    
}

