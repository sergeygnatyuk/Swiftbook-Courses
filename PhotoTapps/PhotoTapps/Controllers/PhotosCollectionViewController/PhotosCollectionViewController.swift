//
//  PhotosCollectionViewController.swift
//  Lesson 11
//
//  Created by Гнатюк Сергей on 13.03.2021.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    // Properties
   private let photos = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    // Dependencies
    private let identifierCell = "pickPhotoSegue"
    private let photoCell = "photoCell"
    public let itemsPerRow: CGFloat = 2
    public let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.showsVerticalScrollIndicator = false
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifierCell {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            photoVC.image = cell.spiderManImageView.image
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCell, for: indexPath) as! PhotoCell
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        cell.spiderManImageView.image = image
        return cell
    }
}
