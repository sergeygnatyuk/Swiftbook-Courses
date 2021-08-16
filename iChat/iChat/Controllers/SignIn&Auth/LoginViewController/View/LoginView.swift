//
//  LoginView.swift
//  iChat
//
//  Created by Гнатюк Сергей on 08.07.2021.
//

import UIKit

final class LoginView: UIView {
    // MARK: - Labels
    let welcomeLabel = UILabel(text: "Welcome Back!", font: .avenir26())
    
    var loginWithLabel = UILabel(text: "Login With")
    
    let orLabel = UILabel(text: "or")
    
    let emailLabel = UILabel(text: "Email")
    
    let passwordLabel = UILabel(text: "Password")
    
    let needAnAccountLabel = UILabel(text: "Need An Account?")
    
    // MARK: - Buttons
    let googleButton = UIButton(title: "Google",
                                isShadow: true,
                                backgroundColor: .white,
                                titleColor: .black)
    
    let loginButton = UIButton(title: "Login",
                                backgroundColor: .buttonBlack(),
                                titleColor: .white)
    
    let signUpButton: UIButton = {
        let signInButton = UIButton()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.buttonRed(), for: .normal)
        signInButton.titleLabel?.font = .avenir20()
        return signInButton
    }()
    
    // MARK: - TextField
    let emailTextField = OneLineTextField(font: .avenir20())
    
    let passwordTextField = OneLineTextField(font: .avenir20())
    
    // MARK: - Constraints
    public func setupUIElements() {
        let loginWithLabel = ButtonFormView(label: loginWithLabel, button: googleButton)
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [loginWithLabel, orLabel, emailStackView, passwordStackView, loginButton], axis: .vertical, spacing: 20)
        
        signUpButton.contentHorizontalAlignment = .leading
        
        let bottomStackView = UIStackView(arrangedSubviews: [needAnAccountLabel, signUpButton], axis: .horizontal, spacing: 10)
        
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(welcomeLabel)
        addSubview(stackView)
        addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
        ])
    }
}
