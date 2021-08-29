//
//  SetupProfileViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 09.07.2021.
//

import UIKit
import FirebaseAuth

final class SetupProfileViewController: UIViewController {
    
    // MARK: - Properties
    let fullImageView = AddPhotoView()
    
    private let currentUser: User
    
    // MARK: - Initialization
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        fullImageView.goToChatsButton.addTarget(self, action: #selector(goToChatsButtonTapped), for: .touchUpInside)
        fullImageView.plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Private
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
    
    // MARK: - Actions
    @objc func goToChatsButtonTapped() {
        FirestoreService.shared.saveProfileWidth(id: currentUser.uid,
                                                 email: currentUser.email!,
                                                 username: fullImageView.fullNameTextField.text,
                                                 avatarImage: fullImageView.circleImageView.image,
                                                 description: fullImageView.aboutMeTextField.text,
                                                 sex: fullImageView.sexSegmentedControl.titleForSegment(at: fullImageView.sexSegmentedControl.selectedSegmentIndex)) { (result) in
                                                switch result {
                                                case .success(let muser):
                                                    self.showAlert(with: "Успешно", and: "Приятного общения!") {
                                                        let mainTabBar = MainTabBarViewController(currentUser: muser)
                                                        mainTabBar.modalPresentationStyle = .fullScreen
                                                        self.present(mainTabBar, animated: true, completion: nil)
                                                    }
                                                case .failure(let error):
                                                    self.showAlert(with: "Ошибка", and: error.localizedDescription)
                                                }
        }
    }
    
    @objc private func plusButtonTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
}

// MARK: - SwiftUI
import SwiftUI

struct SetupProfileViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SetupProfileViewController(currentUser: Auth.auth().currentUser!)
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

