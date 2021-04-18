//
//  UserProfileVC.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 18.04.2021.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth

class UserProfileVC: UIViewController {
    
    var fbLoginButton: UIButton {
       let loginButton = FBLoginButton()
        loginButton.frame = CGRect(x: 32,
                                   y: view.frame.height - 172,
                                   width: view.frame.width - 64,
                                   height: 50)
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

extension UserProfileVC: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        print("Successfully logged in with facebook")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Did log out of facebook")
        openLoginViewController()
    }
    
    private func openLoginViewController() {
        
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyBoard.instantiateViewController(identifier: loginVCIdentifier) as! LoginViewController
                self.present(loginViewController, animated: true)
                return
            }
        } catch let error {
            print("Failed to sign out with error: ", error.localizedDescription)
        }
    }
}
