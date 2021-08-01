//
//  SignUpView.swift
//  iChat
//
//  Created by Гнатюк Сергей on 07.07.2021.
//

import UIKit

final class SignUpView: UIView {
    
    // MARK: - Labels
    let welcomeLabel = UILabel(text: "Good to see you!", font: .avenir26())
    
    let emailLabel = UILabel(text: "Email")
    
    let passwordLabel = UILabel(text: "Password")
    
    let confirmPasswordLabel = UILabel(text: "Confirm Password")
    
    let alreadyOnboardLabel = UILabel(text: "Already Onboard?")
    
    // MARK: - TextFields
    let emailTextField = OneLineTextField(font: .avenir20())
    
    let passwordTextField = OneLineTextField(font: .avenir20())
    
    let confirmPasswordTextField = OneLineTextField(font: .avenir20())
    
    // MARK: - Buttons
    let signUpButton = UIButton(title: "Sign Up", backgroundColor: .buttonBlack(), titleColor: .white, cornerRadius: 4)
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.buttonRed(), for: .normal)
        loginButton.titleLabel?.font = .avenir20()
        return loginButton
    }()
    
    // MARK: - Constraints
    public func setupUIElements() {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField],
                                         axis: .vertical,
                                         spacing: 0)
        
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField],
                                            axis: .vertical,
                                            spacing: 0)
        
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField],
                                                   axis: .vertical,
                                                   spacing: 0)
        
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, confirmPasswordStackView, signUpButton],
                                    axis: .vertical,
                                    spacing: 40)
        
        loginButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [alreadyOnboardLabel, loginButton],
                                          axis: .horizontal,
                                          spacing: 10)
        
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
            
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 130),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
        ])
    }
}
