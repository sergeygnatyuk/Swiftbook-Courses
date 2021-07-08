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
        loginView.setupUIElements()
        view.backgroundColor = .white
    }
}


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
