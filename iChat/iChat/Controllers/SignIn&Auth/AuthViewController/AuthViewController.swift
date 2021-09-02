//
//  ViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 05.07.2021.
//

import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: - Properties
    private let authView = AuthView()
    
    let signUpViewController = SignUpViewController()
    let loginViewController = LoginViewController()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpViewController.delegate = self
        loginViewController.delegate = self
        authView.googleButton.customizeGoogleButton()
        setupUIElements()
        view.backgroundColor = .white
        authView.emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        authView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Private
    private func setupUIElements() {
        authView.addSubviews()
        authView.setupConstraints()
    }
    
    // MARK: - Actions
    @objc private func emailButtonTapped() {
        present(signUpViewController, animated: true, completion: nil)
        print(#function)
    }
    
    @objc private func loginButtonTapped() {
        present(loginViewController, animated: true, completion: nil)
        print(#function)
    }
}
