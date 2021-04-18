//
//  LoginViewController.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 17.04.2021.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth



class LoginViewController: UIViewController {
    
    var fbLoginButton: UIButton {
       let loginButton = FBLoginButton()
        loginButton.frame = CGRect(x: 32,
                                   y: 560,
                                   width: view.frame.width - 64,
                                   height: 50)
        loginButton.delegate = self
        loginButton.layer.cornerRadius = loginButton.frame.height / 3.0
        loginButton.layer.masksToBounds = true
        return loginButton
    }
    
    lazy var customLoginButton: UIButton = {
       let loginButton = UIButton()
        loginButton.backgroundColor = UIColor(hexValue: "#3B5999", alpha: 1)
        loginButton.setTitle("Login with Facebook", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.frame = CGRect(x: 32, y: 560 + 60, width: view.frame.width - 64, height: 50)
        loginButton.layer.cornerRadius = loginButton.frame.height / 3.0
        loginButton.layer.masksToBounds = true
        loginButton.addTarget(self, action: #selector(handCustomFBLogin), for: .touchUpInside)
        return loginButton
    }()

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
        view.addSubview(customLoginButton)
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
    
    @objc private func handCustomFBLogin() {
        
        LoginManager().logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let result = result else { return }
            if result.isCancelled { return }
            else {
                self.singIntoFirebase()
                self.openMainViewController()
            }
        }
    }
    
    private func singIntoFirebase() {
        let accessToken = AccessToken.current
        
        guard let accessTokenString = accessToken?.tokenString else { return }
        
        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        Auth.auth().signIn(with: credentials) { (user, error) in
            if let error = error {
                print("Something went wrong with our facebook user: ", error)
                return
            }
            
            print("Successfully logged in with our FB user: ", user!)
        }
    }
    
}
    
