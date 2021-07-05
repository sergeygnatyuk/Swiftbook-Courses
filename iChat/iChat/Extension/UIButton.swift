//
//  UIButton.swift
//  iChat
//
//  Created by Гнатюк Сергей on 05.07.2021.
//

import UIKit

extension UIButton {
    
    convenience init(title: String,
                     isShadow: Bool = false,
                     backgroundColor: UIColor,
                     font: UIFont? = .avenir20(),
                     titleColor: UIColor,
                     cornerRadius: CGFloat = 4) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(tintColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
}
