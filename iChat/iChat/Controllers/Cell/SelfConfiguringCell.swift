//
//  SelfConfiguringCell.swift
//  iChat
//
//  Created by Гнатюк Сергей on 17.07.2021.
//

import Foundation

protocol SelfConfiguringCell {
    
    // MARK: - Properties
    static var reuseId: String { get }
    
    // MARK: - Methods
    func configure(with value: MChat)
}
