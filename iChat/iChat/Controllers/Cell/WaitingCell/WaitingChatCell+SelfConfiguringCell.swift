//
//  WaitingChatCell+SelfConfiguringCell.swift
//  iChat
//
//  Created by Гнатюк Сергей on 18.07.2021.
//

import UIKit

extension WaitingChatCell: SelfConfiguringCellProtocol {
   
    static var reuseId: String = Identifiers.waitingChatCell
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: MChat = value as? MChat else { return }
        friendImageView.image = UIImage(named: chat.friendAvatarStringURL)
    }
}
