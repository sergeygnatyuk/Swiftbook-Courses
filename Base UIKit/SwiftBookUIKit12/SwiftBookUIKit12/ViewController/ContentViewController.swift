//
//  ContentViewController.swift
//  SwiftBookUIKit12
//
//  Created by Гнатюк Сергей on 01.03.2021.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var button: UIButton!
    
    var presentText = ""
    var emoji = ""
    var curentPage = 0 // Номер текущей страницы
    var numberOfPages = 0 // Количество страниц
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = curentPage
        button.isHidden = true
        button.isHidden = curentPage == 4 ? false : true
    }
    
    @IBAction func closedPresentationButton(_ sender: Any) {
        let vc = PageViewController()
        vc.homeWork(from: self)
    }
}

        

