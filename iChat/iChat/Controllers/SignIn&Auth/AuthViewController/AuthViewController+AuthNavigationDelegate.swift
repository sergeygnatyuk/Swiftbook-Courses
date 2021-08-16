//
//  AuthViewController+AuthNavigationDelegate.swift
//  iChat
//
//  Created by Гнатюк Сергей on 16.08.2021.
//

import UIKit
 
extension AuthViewController: AuthNavigationDelegate {
    func toLoginVC() {
        present(loginViewController, animated: true)
    }
    
    func toSignUoVC() {
        present(signUpViewController, animated: true)
    }
    
    
}

