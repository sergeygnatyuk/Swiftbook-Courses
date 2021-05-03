//
//  CurrentUser.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 22.04.2021.
//

import Foundation

struct CurrentUser {
    let uid: String
    let name: String
    let email: String
    
    init?(uid: String, data: [String: Any]) {
        guard
            let name = data["name"] as? String,
            let email = data["email"] as? String
        else { return nil }
        
        self.uid = uid
        self.name = name
        self.email = email
    }
}
