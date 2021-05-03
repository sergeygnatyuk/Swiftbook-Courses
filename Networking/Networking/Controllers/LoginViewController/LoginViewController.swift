//
//  LoginViewController.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 17.04.2021.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth
import FirebaseDatabase
import GoogleSignIn

class LoginViewController: UIViewController {

    // Dependencies
    public var userProfile: UserProfile?
    
    // Properties
    private var fbLoginButton: UIButton {
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
    
    private lazy var customLoginButton: UIButton = {
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
    
    private var googleLoginButton: GIDSignInButton {
        let loginButton = GIDSignInButton()
        loginButton.frame = CGRect(x: 32, y: 560 + 60 + 60, width: view.frame.width - 64, height: 70)
        return loginButton
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        setupViews()
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    //MARK: - Private
    
    private func setupViews() {
        view.addSubview(fbLoginButton)
        view.addSubview(customLoginButton)
        view.addSubview(googleLoginButton)
    }
}






