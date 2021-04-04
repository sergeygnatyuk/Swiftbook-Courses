//
//  DetailViewController.swift
//  SwiftBookUIKit6
//
//  Created by Гнатюк Сергей on 25.02.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var trackTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: trackTitle)
        label.text = trackTitle
        label.numberOfLines = 0

    }

}
