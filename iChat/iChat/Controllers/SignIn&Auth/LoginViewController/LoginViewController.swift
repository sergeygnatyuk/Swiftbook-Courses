//
//  LoginViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 08.07.2021.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    let loginView: LoginView = {
        let loginView = LoginView()
        return loginView
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.googleButton.customizeGoogleButton()
        loginView.setupUIElements()
        view.backgroundColor = .white
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func loginButtonTapped() {
        AuthService.shared.login(email: loginView.emailTextField.text, password: loginView.passwordTextField.text) { result in
            switch result {
            case .success(let user):
                self.showAlert(with: "Успешно", and: "Вы Авторизованы!")
            case .failure(let error):
                self.showAlert(with: "Ошибка!", and: error.localizedDescription)
            }
        }
        print(#function)
    }
}

// MARK: - SwiftUI
import SwiftUI

struct LoginViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = LoginViewController()
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
