//
//  WebsiteDescription .swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 10.04.2021.
//

import Foundation

struct WebsiteDescription: Decodable {
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]
}
