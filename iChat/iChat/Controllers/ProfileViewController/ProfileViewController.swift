//
//  ProfileViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 23.07.2021.
//

import UIKit
import SDWebImage

final class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    let containerView = ProfileView()
    private let user: MUser
    
    // MARK: - Initialization
    init(user: MUser) {
        self.user = user
        self.containerView.nameLabel.text = user.username
        self.containerView.aboutMeLabel.text = user.description
        self.containerView.imageView.sd_setImage(with: URL(string: user.avatarStringURL), completed: nil)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.setupConstraints()
        configure()
    }
    
    // MARK: - Actions
    private func configure() {
        if let button = containerView.myTextField.rightView as? UIButton {
            button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        }
    }
    
    // MARK: - @objc methods
    @objc private func sendMessage() {
        guard let message = containerView.myTextField.text, message != "" else { return }
        self.dismiss(animated: true) {
            FirestoreService.shared.createWaitingChat(message: message, receiver: self.user) { result in
                switch result {
                case .success():
                    UIApplication.getTopViewController()?.showAlert(with: "Success", and: "Ваше сообщение для \(self.user.username) было отправлено.")
                case .failure(let error):
                    UIApplication.getTopViewController()?.showAlert(with: "Error", and: error.localizedDescription)
                }
            }
        }
    }
}
