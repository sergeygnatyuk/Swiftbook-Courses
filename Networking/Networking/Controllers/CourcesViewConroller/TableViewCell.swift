//
//  TableViewCell.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 10.04.2021.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    // UI
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
}
