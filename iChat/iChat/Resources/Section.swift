//
//  Section.swift
//  iChat
//
//  Created by Гнатюк Сергей on 15.07.2021.
//

import Foundation

enum Section: Int, CaseIterable {
    case waitingChats
    case activeChats
    
    func description() -> String {
        switch self {
        case .waitingChats:
            return "Waiting Chats"
        case .activeChats:
            return "Active Chats"
        }
    }
}
