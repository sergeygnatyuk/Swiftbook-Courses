//
//  ImageViewController.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 09.04.2021.
//

import UIKit
import Alamofire

final class ImageViewController: UIViewController {
    
    // Dependencies
    private lazy var networkManager = NetworkManager()
    
    // Properties
    private let url = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    private let largeImageUrl = "https://i.imgur.com/3416rvI.jpg"
    
    // UI
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var completedLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        completedLabel.isHidden = true
        progressView.isHidden = true
    }
    
    //MARK: - Public
    
    public func fetchImage() {
        networkManager.downloadImage(url: url) { image in
            self.activityIndicator.stopAnimating()
            self.imageView.image = image
        }
    }
    
    public func fetchDataWithAlamofire() {
        AlamofireNetworkRequest.downloadImage(url: url) { image in
                self.activityIndicator.stopAnimating()
                self.imageView.image = image
            }
        }
    
    public func downloadImageWithProgress() {
        AlamofireNetworkRequest.onProgress = { progress in
        self.progressView.isHidden = false
        self.progressView.progress = Float(progress)
        }
    
        AlamofireNetworkRequest.completed = { completed in
            self.completedLabel.isHidden = false
            self.completedLabel.text = completed
        }
        
        AlamofireNetworkRequest.downloadImageWithProgress(url: largeImageUrl) { image in
            self.activityIndicator.stopAnimating()
            self.completedLabel.isHidden = true
            self.progressView.isHidden = true
            self.imageView.image = image
        }
    }
}
