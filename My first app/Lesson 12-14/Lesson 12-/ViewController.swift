//
//  ViewController.swift
//  Lesson 12-
//
//  Created by Гнатюк Сергей on 07.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else {
            return
        }
        
        let caledar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = caledar.date(from: dateComponents) else { return }
        let weekDay = dateFormatter.string(from: date)
        let capitalizedWeekday = weekDay.capitalized
        
        resultLabel.text = capitalizedWeekday
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

