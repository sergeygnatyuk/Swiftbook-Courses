//
//  UserProfileVC.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 18.04.2021.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth
import FirebaseDatabase

class UserProfileVC: UIViewController {
    
    // Properties
    private lazy var fbLoginButton: UIButton = {
        let loginButton = FBLoginButton()
        loginButton.frame = CGRect(x: 32,
                                   y: view.frame.height - 172,
                                   width: view.frame.width - 64,
                                   height: 50)
        loginButton.delegate = self
        return loginButton
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    // UI
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        userNameLabel.isHidden = true
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchingUserData()
    }
    
    //MARK: - Private
    
    private func setupViews() {
        view.addSubview(fbLoginButton)
    }
}
