//
//  AuthView.swift
//  iChat
//
//  Created by Гнатюк Сергей on 05.07.2021.
//

import UIKit

final class AuthView: UIView {
    
    // MARK: - Buttons
    private lazy var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let googleButton = UIButton(title: "Google",
                                isShadow: true,
                                backgroundColor: .white,
                                titleColor: .black)
    
    let emailButton = UIButton(title: "Email",
                               backgroundColor: .buttonBlack(),
                               titleColor: .white)
    
    let loginButton = UIButton(title: "Login",
                               isShadow: true,
                               backgroundColor: .white,
                               titleColor: .buttonRed())
    
    // MARK: - Labels
    let googleLabel = UILabel(text: "Get Started With")
    
    let emailLabel = UILabel(text: "Or Sign Up With")
    
    let alreadyOnboardLabel = UILabel(text: "Already Onboard?")
    
    // MARK: - ImageView
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    // MARK: - Public
    public func addSubviews() {
        addSubview(logoImageView)
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        let googleView = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyOnboardLabel, button: loginButton)
        
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
}

