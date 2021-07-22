//
//  ActiveChatCell+SelfConfiguringCell.swift
//  iChat
//
//  Created by Гнатюк Сергей on 17.07.2021.
//

import UIKit

extension ActiveChatCell: SelfConfiguringCellProtocol {
    
    static var reuseId: String = Identifiers.activeChatCell
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: MChat = value as? MChat else { return }
        friendImageView.image = UIImage(named: chat.userImageString)
        friendNameLabel.text = chat.username
        lastMessageLabel.text = chat.lastMessage
    }
}
