//
//  ExtensionUserProfileVC.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 03.05.2021.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth
import FirebaseDatabase
import GoogleSignIn

extension UserProfileVC {
    
    //MARK: - Public
    
    public func fetchingUserData() {
        
        if Auth.auth().currentUser != nil {
            
            if let userName = Auth.auth().currentUser?.displayName {
                activityIndicator.stopAnimating()
                userNameLabel.isHidden = false
                userNameLabel.text = getProviderData(with: userName)
            } else {
                guard let uid = Auth.auth().currentUser?.uid else { return }
                
                Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    guard let userData = snapshot.value as? [String: Any] else { return }
                    
                    self.currentUser = CurrentUser(uid: uid, data: userData)
                    
                    self.activityIndicator.stopAnimating()
                    self.userNameLabel.isHidden = false
                    self.userNameLabel.text = self.getProviderData(with: self.currentUser?.name ?? "NoName")
                    
                }) { (error) in
                    print(error)
                }
            }
        }
    }
    
    //MARK: - Private
    
    private func openLoginViewController() {
        
        do {
            try Auth.auth().signOut()
            
            DispatchQueue.main.async {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                self.present(loginViewController, animated: true)
                return
            }
            
        } catch let error {
            print("Failed to sign out with error: ", error.localizedDescription)
        }
    }
    
    private func getProviderData(with user: String) -> String {
        var greetings = ""
        
        if let providerData = Auth.auth().currentUser?.providerData {
            
            for userInfo in providerData {
                
                switch userInfo.providerID {
                case "facebook.com":
                    provider = "Facebook"
                case "google.com":
                    provider = "Google"
                case "password":
                    provider = "Email"
                default:
                    break
                }
            }
            greetings = "\(user) Logged in with \(provider!)"
        }
        return greetings
    }
    
    //MARK: - @objc methods
    
    @objc public func signOut() {
        if let providerData = Auth.auth().currentUser?.providerData {
            for userInfo in providerData {
                switch userInfo.providerID {
                case "facebook.com":
                    LoginManager().logOut()
                    print("User did log out of Facebook")
                    openLoginViewController()
                case "google.com":
                    GIDSignIn.sharedInstance()?.signOut()
                    print("Used did log out of Google")
                    openLoginViewController()
                case "password":
                    try!Auth.auth().signOut()
                    print("User did sign out")
                    openLoginViewController()
                default:
                    print("User is signed in with \(userInfo.providerID)")
                }
            }
        }
    }
}
