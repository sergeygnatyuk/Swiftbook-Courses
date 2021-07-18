//
//  WaitingChatCell+SelfConfiguringCell.swift
//  iChat
//
//  Created by Гнатюк Сергей on 18.07.2021.
//

import UIKit

extension WaitingChatCell: SelfConfiguringCellProtocol {
    
    static var reuseId: String = Identifiers.waitingChatCell
    
    func configure(with value: MChat) {
        friendImageView.image = UIImage(named: value.userImageString)
    }
}
