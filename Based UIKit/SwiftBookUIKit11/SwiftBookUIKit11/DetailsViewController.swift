//
//  DetailsViewController.swift
//  SwiftBookUIKit11
//
//  Created by Гнатюк Сергей on 28.02.2021.
//

import UIKit

class DetailsViewController: UITableViewController {
    
    private let cellHeight: CGFloat = 60
    
    private let withIdentifierString: String = "Title"
    
    private let imageNameArray = [   "Johnny  Goode - Chuck Berry",
                                     "Purple Haze - Jimi Hendrix",
                                     "Crossroads - Cream",
                                     "You Really Got Me - The Kinks",
                                     "Brown Sugar - The Rolling Stones",
                                     "Eruption - Van Halen",
                                     "While My Guitar Gently Weeps - The Beatles",
                                     "Stairway to Heaven - Led Zeppelin"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageNameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: withIdentifierString, for: indexPath)
        
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        cell.textLabel?.text = imageNameArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = parent as? ViewController {
        let trackTitle = imageNameArray[indexPath.row]
        viewController.titleLabel.text = trackTitle
        viewController.imageCover.image = UIImage(named: trackTitle)
    }
    
    
}
}
