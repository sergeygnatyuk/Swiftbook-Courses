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

final class LoginViewController: UIViewController {
    
    // Properties
    private let signInIdentifier = "SignIn"
    
    // Dependencies
    public var userProfile: UserProfile?
    
    //MARK: - Buttons
    
    private var fbLoginButton: UIButton {
        let loginButton = FBLoginButton()
        loginButton.frame = CGRect(x: 32, y: 480, width: view.frame.width - 64, height: 50)
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
        loginButton.frame = CGRect(x: 32, y: 480 + 60, width: view.frame.width - 64, height: 50)
        loginButton.layer.cornerRadius = loginButton.frame.height / 3.0
        loginButton.layer.masksToBounds = true
        loginButton.addTarget(self, action: #selector(handCustomFBLogin), for: .touchUpInside)
        return loginButton
    }()
    
    private var googleLoginButton: GIDSignInButton {
        let loginButton = GIDSignInButton()
        loginButton.frame = CGRect(x: 32, y: 480 + 60 + 60 + 60, width: view.frame.width - 64, height: 70)
        return loginButton
    }
    
    private lazy var customGoogleLoginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.frame = CGRect(x: 32, y: 480 + 60 + 60, width: view.frame.width - 64, height: 45)
        loginButton.backgroundColor = .white
        loginButton.setTitle("Login with Google", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.setTitleColor(.gray, for: .normal)
        loginButton.layer.cornerRadius = loginButton.frame.height / 3.0
        loginButton.addTarget(self, action: #selector(handleCustomGoogleLogin), for: .touchUpInside)
        return loginButton
    }()
    
    private lazy var signInWithEmail: UIButton = {
        let loginButton = UIButton()
        loginButton.frame = CGRect(x: 32, y: 480 + 60 + 60 + 120, width: view.frame.width - 64, height: 45)
        loginButton.setTitle("Sign In With Email", for: .normal)
        loginButton.addTarget(self, action: #selector(openSignVC), for: .touchUpInside)
        return loginButton
    }()
    
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
        view.addSubview(customGoogleLoginButton)
        view.addSubview(googleLoginButton)
        view.addSubview(signInWithEmail)
    }
    
    //MARK: - @objc methods
    
    @objc private func handleCustomGoogleLogin() {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @objc private func openSignVC() {
        performSegue(withIdentifier: signInIdentifier, sender: self)
    }
}






