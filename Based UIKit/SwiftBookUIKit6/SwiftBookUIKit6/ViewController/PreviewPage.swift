//
//  PreviewPage.swift
//  SwiftBookUIKit6
//
//  Created by Гнатюк Сергей on 25.02.2021.
//

import UIKit

private let reuseIdentifier = "ArtCover"

class PreviewPage: UICollectionViewController {
    private let imageNameArray = ["Johnny  Goode - Chuck Berry",
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
    
    
    

     
    
    // MARK: UICollectionViewDataSource
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCoverCell
        
        cell.coverImageView.image = UIImage(named: imageNameArray[indexPath.row])
        
        
        return cell
    }
    
    //MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let song = imageNameArray[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController
        
        detailViewController?.trackTitle = imageNameArray[indexPath.item]
      // 1 detailViewController.modalPresentationStyle = .fullScreen
       // 1 present(detailViewController, animated: true)
        
 //   2    present(detailViewController, animated: true)
        
        navigationController!.pushViewController(detailViewController!, animated: true)
        
        // TODO безопасное приведение типов
    }
    
}
