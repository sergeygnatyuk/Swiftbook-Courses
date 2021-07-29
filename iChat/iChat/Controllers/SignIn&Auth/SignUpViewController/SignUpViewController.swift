//
//  SignUpViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 07.07.2021.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    // MARK: - UI
    let signUpView: SignUpView = {
        let signUpView = SignUpView()
        return signUpView
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.loginButton.setTitle("Login", for: .normal)
        signUpView.loginButton.setTitleColor(.buttonRed(), for: .normal)
        view.backgroundColor = .white
        signUpView.setupUIElements()
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func signUpButtonTapped() {
        AuthService.shared.register(email: signUpView.emailTextField.text, password: signUpView.passwordTextField.text, confirmPassword: signUpView.confirmPasswordTextField.text ?? "") { result in
            switch result {
            case .success(let user):
                self.showAlert(with: "Успешно", and: "Вы Зарегистрированы!")
                print(user.email as Any)
            case .failure(let error):
                self.showAlert(with: "Ошибка!", and: error.localizedDescription)
            }
        }
        print(#function)
    }
}

// MARK: - SwiftUI
import SwiftUI

struct SignUpViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SignUpViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
