//
//  UserProfile.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 21.04.2021.
//

import Foundation


struct UserProfile {
    let id: Int?
    let name: String?
    let email: String?
    
    init(data: [String: Any]) {
        let id = data["id"] as? Int
        let name = data["name"] as? String
        let email = data["email"] as? String
        
        self.id = id
        self.name = name
        self.email = email
        
    }
}
