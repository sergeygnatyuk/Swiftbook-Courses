//
//  SetupProfileViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 09.07.2021.
//

import UIKit

final class SetupProfileViewController: UIViewController {
    
    // MARK: - Properties
    let fullImageView = AddPhotoView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
    
    private func setupConstraints() {
        let fullNameStackView = UIStackView(arrangedSubviews: [fullImageView.fullNameLabel, fullImageView.fullNameTextField], axis: .vertical, spacing: 0)
        
        let aboutMeStackView = UIStackView(arrangedSubviews: [fullImageView.aboutMeLabel, fullImageView.aboutMeTextField], axis: .vertical, spacing: 0)
        
        let sexStackView = UIStackView(arrangedSubviews: [fullImageView.sexLabel, fullImageView.sexSegmentedControl], axis: .vertical, spacing: 12)
        
        let stackView = UIStackView(arrangedSubviews: [fullNameStackView, aboutMeStackView, sexStackView, fullImageView.goToChatsButton], axis: .vertical, spacing: 40)
        
        fullImageView.goToChatsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        fullImageView.welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fullImageView)
        view.addSubview(fullImageView.welcomeLabel)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            fullImageView.welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            fullImageView.welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            fullImageView.topAnchor.constraint(equalTo: fullImageView.welcomeLabel.bottomAnchor, constant: 40),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct SetupProfileViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SetupProfileViewController()
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

