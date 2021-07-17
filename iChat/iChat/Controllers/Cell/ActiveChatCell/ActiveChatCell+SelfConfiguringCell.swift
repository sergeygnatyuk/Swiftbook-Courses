//
//  ActiveChatCell+SelfConfiguringCell.swift
//  iChat
//
//  Created by Гнатюк Сергей on 17.07.2021.
//

import UIKit

extension ActiveChatCell: SelfConfiguringCell {
    
    static var reuseId: String = Identifiers.activeChatCell
    
    func configure(with value: MChat) {
        friendImageView.image = UIImage(named: value.userImageString)
        friendNameLabel.text = value.username
        lastMessageLabel.text = value.lastMessage
    }
}
