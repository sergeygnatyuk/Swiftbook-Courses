//
//  UIImageView.swift
//  iChat
//
//  Created by Гнатюк Сергей on 05.07.2021.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}


