//
//  SectionHeader.swift
//  iChat
//
//  Created by Гнатюк Сергей on 20.07.2021.
//

import UIKit

final class SectionHeader: UICollectionReusableView {
    
    // MARK: - Properties
    static let reuseId = Identifiers.sectionHeader
    let title = UILabel()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    public func configure(text: String, font: UIFont?, textColor: UIColor) {
        title.textColor = textColor
        title.font = font
        title.text = text
    }
}
