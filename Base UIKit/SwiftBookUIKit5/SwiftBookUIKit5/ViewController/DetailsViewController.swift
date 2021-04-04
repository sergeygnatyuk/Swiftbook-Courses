//
//  DetailVC.swift
//  SwiftBookUIKit5
//
//  Created by Гнатюк Сергей on 23.02.2021.
//

import UIKit

final class DetailsViewController: UIViewController {
    

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var trackTitle = ""
    private let numberOfLinesInLabel = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = UIImage(named: trackTitle)
        label.text = trackTitle
        label.numberOfLines = numberOfLinesInLabel
        
        
        
    }
    
}
