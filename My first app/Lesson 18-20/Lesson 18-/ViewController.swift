//
//  ViewController.swift
//  Lesson 18-
//
//  Created by Гнатюк Сергей on 09.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func loginTapped(_ sender: UIButton) {
            performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        guard let svc = segue.source as? SecondViewController else { return }
        self.resultLabel.text = svc.label.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController else { return }
        dvc.login = loginTextField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

