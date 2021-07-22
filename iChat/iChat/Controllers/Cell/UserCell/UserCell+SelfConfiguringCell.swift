//
//  UserCell+SelfConfiguringCell.swift
//  iChat
//
//  Created by Гнатюк Сергей on 22.07.2021.
//

import UIKit

extension UserCell: SelfConfiguringCellProtocol {
   
    static var reuseId: String = Identifiers.userCell
   
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MUser = value as? MUser else { return }
        userImageView.image = UIImage(named: user.avatarStringURL)
        userName.text = user.username
    }
}
