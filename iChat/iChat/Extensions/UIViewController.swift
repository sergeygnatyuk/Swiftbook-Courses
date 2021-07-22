//
//  UIViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 22.07.2021.
//

import UIKit

extension UIViewController {
    
    func configure<T: SelfConfiguringCellProtocol, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
        cell.configure(with: value)
        return cell
    }
}
