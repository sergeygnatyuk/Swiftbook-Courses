//
//  UserCell+SelfConfiguringCell.swift
//  iChat
//
//  Created by Гнатюк Сергей on 22.07.2021.
//

import UIKit
import SDWebImage

extension UserCell: SelfConfiguringCellProtocol {
   
    static var reuseId: String = Identifiers.userCell
   
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MUser = value as? MUser else { return }
        userName.text = user.username
        guard let url = URL(string: user.avatarStringURL) else { return }
        userImageView.sd_setImage(with: url, completed: nil)
    }
}
