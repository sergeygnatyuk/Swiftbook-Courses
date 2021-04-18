//
//  LoginViewController.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 17.04.2021.
//

import UIKit
import FBSDKLoginKit



class LoginViewController: UIViewController {
    
    var fbLoginButton: UIButton {
       let loginButton = FBLoginButton()
        loginButton.frame = CGRect(x: 32, y: 520, width: view.frame.width - 64, height: 50)
        loginButton.delegate = self
        loginButton.layer.cornerRadius = loginButton.frame.height / 3.0
        loginButton.layer.masksToBounds = true
        return loginButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        setupViews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    private func setupViews() {
        view.addSubview(fbLoginButton)
    }

}
//MARK: Facebook SDK
extension LoginViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        guard AccessToken.isCurrentAccessTokenActive else { return }
        openMainViewController()
        
        print("Successfully logged in with facebook")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Did log out of facebook")
    }
    private func openMainViewController() {
        dismiss(animated: true)
    }
}
    
