//
//  Course.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 10.04.2021.
//

import Foundation

struct Course: Decodable {
    
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
}
