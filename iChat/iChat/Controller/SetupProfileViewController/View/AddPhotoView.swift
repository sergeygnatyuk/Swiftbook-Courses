//
//  AddPhotoView.swift
//  iChat
//
//  Created by Гнатюк Сергей on 09.07.2021.
//

import UIKit

class AddPhotoView: UIView {
    
    // MARK: - ImageView
    var circleImageView: UIImageView = {
        let circleImageView = UIImageView()
        circleImageView.translatesAutoresizingMaskIntoConstraints = false
        circleImageView.image = #imageLiteral(resourceName: "avatar")
        circleImageView.contentMode = .scaleAspectFill
        circleImageView.clipsToBounds = true
        circleImageView.layer.borderColor = UIColor.black.cgColor
        circleImageView.layer.borderWidth = 1
        return circleImageView
    }()
    
    // MARK: - Button
    var plusButton: UIButton = {
        let plusButton = UIButton(type: .system)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        let myImage = #imageLiteral(resourceName: "plus")
        plusButton.setImage(myImage, for: .normal)
        plusButton.tintColor = .buttonBlack()
        return plusButton
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
    }
    
    // MARK: - Public
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            circleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            circleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            circleImageView.widthAnchor.constraint(equalToConstant: 100),
            circleImageView.heightAnchor.constraint(equalToConstant: 100),
            
            plusButton.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16),
            plusButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: plusButton.trailingAnchor).isActive = true
    }
    
    public func addSubviews() {
        addSubview(circleImageView)
        addSubview(plusButton)
    }
}
