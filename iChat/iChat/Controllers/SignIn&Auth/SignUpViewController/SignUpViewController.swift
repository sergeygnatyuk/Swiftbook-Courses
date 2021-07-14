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
