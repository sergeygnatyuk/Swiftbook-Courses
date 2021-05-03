//
//  CustomTableViewCell.swift
//  Lesson 2 MyPlaces
//
//  Created by Гнатюк Сергей on 14.03.2021.
//

import UIKit
import Cosmos

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOfPlace: UIImageView!{
        didSet {
            let halfLineHeight = 2
            imageOfPlace?.layer.cornerRadius = imageOfPlace.frame.size.height / CGFloat(halfLineHeight)
            imageOfPlace?.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!{
    didSet {
        cosmosView.settings.updateOnTouch = false
        }
    }
}
