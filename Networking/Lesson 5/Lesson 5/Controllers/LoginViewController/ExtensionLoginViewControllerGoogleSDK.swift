//
//  ExtensionLoginViewControllerGoogleSDK.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 03.05.2021.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

//MARK: - Google SDK

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!,
              didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("Failed to log into Google: ", error)
            return
        }
        
        print("Successfully logged into Google")
        
        guard let authentication = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("Something went wrong with our Google user: ", error)
                return
            }
            print("Successfully logged into Firebase with Google")
            self.openMainViewController()
        }
    }
}
