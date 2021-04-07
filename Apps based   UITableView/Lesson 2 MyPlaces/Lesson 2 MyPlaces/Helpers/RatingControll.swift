//
//  RatingControl.swift
//  Lesson 2 MyPlaces
//
//  Created by Гнатюк Сергей on 19.03.2021.
//

import UIKit
@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    var rating = 0 {
        didSet {
            updateButtonSelectedState()
        }
    }
    
    private var ratingButton = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        
        didSet {
            setupButtons()
        }
        
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    
 //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super .init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Active
    @objc func ratingButtonTapped(button: UIButton) {
        
        guard let index = ratingButton.firstIndex(of: button) else {return}
        
        //Calculate the raiting of the selected button
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        }else{
            rating = selectedRating
        }
    }
    
    //MARK: Private methods
    
    private func setupButtons() {
        
        
        for button in ratingButton {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButton.removeAll()
        
        //Load button image
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "Star2", in: bundle, compatibleWith: self.traitCollection)
        
        let emptyStar = UIImage(named: "Star1", in: bundle, compatibleWith: self.traitCollection)
        
        let highlighterStar = UIImage(named: "Star3", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount{
            
            //create the button
            let button = UIButton()
            
            //Set the button image
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlighterStar, for: .highlighted)
            button.setImage(highlighterStar, for: [.highlighted, .selected])
            
            // add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //Setup the button action
            
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            
            
            
            //Add the button to the stack
            addArrangedSubview(button)
            
            
            //Add the new button on the rating button array
            ratingButton.append(button)
        }
        updateButtonSelectedState()
    }
    
    private func updateButtonSelectedState() {
        for(index, button) in ratingButton.enumerated(){
            button.isSelected = index < rating
        }
    }

}
