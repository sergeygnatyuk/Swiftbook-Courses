//
//  ViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 05.07.2021.
//

import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: - Properties
    let authView: AuthView = {
        let authView = AuthView()
        return authView
    }()
    
    private lazy var signUpViewController = SignUpViewController()
    private lazy var loginViewController = LoginViewController()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

// MARK: - SwiftUI
import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = AuthViewController()
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
