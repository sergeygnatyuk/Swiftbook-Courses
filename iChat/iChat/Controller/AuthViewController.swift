//
//  ViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 05.07.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    // MARK: - Properties
    let authView: AuthView = {
        let authView = AuthView()
        return authView
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
        view.backgroundColor = .white
    }
    
    // MARK: - Private
    private func setupUIElements() {
        authView.addSubviews()
        authView.setupConstraints()
    }
}

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
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
