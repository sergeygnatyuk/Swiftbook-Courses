//
//  WaitingCell.swift
//  iChat
//
//  Created by Гнатюк Сергей on 18.07.2021.
//

import UIKit

final class WaitingChatCell: UICollectionViewCell {
    
    // MARK: - Properties
    let friendImageView = UIImageView()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(friendImageView)
        NSLayoutConstraint.activate([
            friendImageView.topAnchor.constraint(equalTo: topAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
