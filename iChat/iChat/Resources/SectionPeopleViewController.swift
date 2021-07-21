//
//  SectionPeopleViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 21.07.2021.
//

import Foundation

enum SectionPeople: Int, CaseIterable {
    case users
    
    func description(usersCount: Int) -> String {
        switch self {
        case .users:
            return "\(usersCount) People Nearby"
        }
    }
}
