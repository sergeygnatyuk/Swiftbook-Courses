//
//  OneLineTextField .swift
//  iChat
//
//  Created by Гнатюк Сергей on 07.07.2021.
//

import UIKit

final class OneLineTextField: UITextField {
    
    // MARK: - Initialization
    convenience init(font: UIFont? = .avenir20()) {
        self.init()
        self.font = font
        self.borderStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - View
        var bottomView = UIView()
        bottomView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bottomView.backgroundColor = .textFieldLight()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomView)
        
        // MARK: - Constraints
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
