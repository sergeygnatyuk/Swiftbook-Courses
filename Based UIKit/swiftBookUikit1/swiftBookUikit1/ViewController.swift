//
//  ViewController.swift
//  swiftBookUikit1
//
//  Created by Гнатюк Сергей on 14.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelEdit: UILabel!
    
    @IBOutlet weak var buttonEdit: UIButton!
    @IBOutlet var buttonsAction: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        labelEdit.isHidden = true
        labelEdit.font = labelEdit.font.withSize(35)
        
        buttonEdit.isHidden = true
        
        for _ in buttonsAction {
            buttonEdit.setTitleColor(.blue, for: .normal)
            buttonEdit.backgroundColor = .green
        }
        
        buttonEdit.setTitle("Clear", for: .normal)
        buttonEdit.setTitleColor(.white, for: .normal)
        buttonEdit.backgroundColor = .red
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
     
        labelEdit.isHidden = false
        buttonEdit.isHidden = false
        
        if sender.tag == 0 {
            labelEdit.text = "Hello, World!"
            labelEdit.textColor = .red
            
        }else if sender.tag == 1 {
            labelEdit.text = "Hi there!"
            labelEdit.textColor = .blue
        }else if sender.tag == 2{
            labelEdit.isHidden = true
            buttonEdit.isHidden = true
        }
        
        
        
    }
    
}

