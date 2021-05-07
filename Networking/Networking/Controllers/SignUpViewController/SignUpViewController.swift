//
//  SignUpViewController.swift
//  Networking
//
//  Created by Гнатюк Сергей on 07.05.2021.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
   
    // Dependencies
    private var activityIndicator: UIActivityIndicatorView!

    // UI
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    //MARK: - Buttons
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = CGPoint(x: view.center.x, y: view.frame.height - 120)
        button.backgroundColor = .white
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(secondaryColor, for: .normal)
        button.layer.cornerRadius = 4
        button.alpha = 0.5
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        view.addSubview(continueButton)
        setContinueButton(enabled: false)
        
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = secondaryColor
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = continueButton.center
        
        view.addSubview(activityIndicator)
        
        userNameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    //MARK: - Private
    
    private func setContinueButton(enabled: Bool) {
        if enabled {
            continueButton.alpha = 1.0
            continueButton.isEnabled = true
        } else {
            continueButton.alpha = 0.5
            continueButton.isEnabled = false
        }
    }
    
    //MARK: - Actions
    
    @IBAction func goBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - @objc methods
    
    @objc private func handleSignUp() {
        setContinueButton(enabled: false)
        continueButton.setTitle("", for: .normal)
        activityIndicator.startAnimating()
        
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let userName = userNameTextField.text
        else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                self.setContinueButton(enabled: true)
                self.continueButton.setTitle("Continue", for: .normal)
                self.activityIndicator.stopAnimating()
                
                return
            }
            print("Successfully logged into Firebase with User Email")
            
            if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                changeRequest.displayName = userName
                changeRequest.commitChanges { (error) in
                    if let error = error {
                        print(error.localizedDescription)
                        
                        self.setContinueButton(enabled: true)
                        self.continueButton.setTitle("Continue", for: .normal)
                        self.activityIndicator.stopAnimating()
                    }
                    print("User display changed!")
                    self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @objc private func textFieldChanged() {
        guard
            let userName = userNameTextField.text,
            let email = emailTextField.text,
        let password = passwordTextField.text,
            let confirmPassword = confirmPasswordTextField.text
            else { return }
        
        let formField = !(email.isEmpty) && !(password.isEmpty) && !(userName.isEmpty) && confirmPassword == password
        setContinueButton(enabled: formField)
    }
    
    @objc private func keyboardWillAppear(notification: NSNotification) {
        let userInfo = notification.userInfo!
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        continueButton.center = CGPoint(x: view.center.x, y: view.frame.height - keyboardFrame.height - 16.0 - continueButton.frame.height / 2)
        
        activityIndicator.center = continueButton.center
    }
}
