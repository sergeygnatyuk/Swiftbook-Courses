//
//  AuthView.swift
//  iChat
//
//  Created by Гнатюк Сергей on 05.07.2021.
//

import UIKit

final class AuthView: UIView {
    
    // MARK: - UI
    private lazy var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let loginButton = UIButton(title: "Email",
                            isShadow: true,
                            backgroundColor: .white,
                            titleColor: .buttonRed())
    
    let emailButton = UIButton(title: "Login",
                            backgroundColor: .buttonBlack(),
                            titleColor: .white)
    
    let googleButton = UIButton(title: "Google",
                            isShadow: true,
                            backgroundColor: .white,
                            titleColor: .black)
    
    let googleLabel = UILabel(text: "Get Started With")
    
    let emailLabel = UILabel(text: "Or Sign Up With")
    
    let alreadyOnboardLabel = UILabel(text: "Already Onboard?")
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
}
