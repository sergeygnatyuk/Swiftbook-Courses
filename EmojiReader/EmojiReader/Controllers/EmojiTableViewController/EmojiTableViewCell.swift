//
//  EmojiTableViewCell.swift
//  Lesson 2 EmojiReader
//
//  Created by Гнатюк Сергей on 11.03.2021.
//

import UIKit

final class EmojiTableViewCell: UITableViewCell {
    
    // UI
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    //MARK: - Public
    public func set(object: Emoji) {
        self.emojiLabel.text = object.emoji
        self.nameLabel.text = object.name
        self.descriptionLabel.text = object.description
    }
}
