//
//  ProfileContainerView.swift
//  iChat
//
//  Created by Гнатюк Сергей on 23.07.2021.
//

import UIKit

final class ProfileView: UIView {
    
    // MARK: - Propertyes
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human8"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Peter Denis", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "You have the opportunity to chat with the best man the world!", font: .systemFont(ofSize: 16, weight: .light))
    let myTextField = InsertableTextField()
    
    // MARK: - Private
    private func customizeElements() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.numberOfLines = 0
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
       
    }
    
    // MARK: - Public
    public func setupConstraints() {
        customizeElements()
        addSubview(imageView)
        addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(myTextField)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 206),
            
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 8),
            aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            myTextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor,constant: 8),
            myTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            myTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            myTextField.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
