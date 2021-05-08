//
//  PhotoViewController.swift
//  Lesson 11
//
//  Created by Гнатюк Сергей on 13.03.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    
    // Dependencies
   public var image: UIImage?
    
    // UI
    @IBOutlet weak var photoImageView: UIImageView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = image
    }
    
    //MARK: - Actions
    
    @IBAction func shareAction(_ sender: UIButton) {
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Успешно!")
            }
        }
        present(shareController, animated: true, completion: nil)
    }
}
