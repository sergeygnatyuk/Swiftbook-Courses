//
//  ExtensionLoginViewControllerFBSDK.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 03.05.2021.
//
import UIKit
import FBSDKLoginKit
import FirebaseAuth
import FirebaseDatabase


//MARK: - Facebook SDK

extension LoginViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        guard AccessToken.isCurrentAccessTokenActive else { return }
        singIntoFirebase()
        print("Successfully logged in with facebook")
    }
    
    //MARK: - Public
    
    public func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Did log out of facebook")
    }
    
    public func openMainViewController() {
        dismiss(animated: true)
    }
    
    public func saveInfoFirebase() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let userData = ["name": userProfile?.name, "email": userProfile?.email]
        
        let values = [uid: userData]
        Database.database().reference().child("users").updateChildValues(values) { (error, _) in
            if let error = error {
                print(error)
                return
            }
            print("Successfully saved user into firebase")
            self.openMainViewController()
        }
    }
    
    //MARK: - @objc methods
    
    @objc public func handCustomFBLogin() {
        LoginManager().logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let result = result else { return }
            if result.isCancelled { return }
            else {
                self.singIntoFirebase()
            }
        }
    }
    
    //MARK: - Private
    
    private func singIntoFirebase() {
        let accessToken = AccessToken.current
        
        guard let accessTokenString = accessToken?.tokenString else { return }
        
        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        Auth.auth().signIn(with: credentials) { (user, error) in
            if let error = error {
                print("Something went wrong with our facebook user: ", error)
                return
            }
            print("Successfully logged in with our FB user")
            self.fetchFacebookFields()
        }
    }
    
    private func fetchFacebookFields() {
        GraphRequest(graphPath: "me", parameters: ["fields": "id, name, email"]).start { (_, result, error) in
            if let error = error {
                print(error)
                return
            }
            if let userData = result as? [String: Any] {
                self.userProfile = UserProfile(data: userData)
                print(userData)
                print(self.userProfile?.name ?? "nil")
                self.saveInfoFirebase()
            }
        }
    }
}
