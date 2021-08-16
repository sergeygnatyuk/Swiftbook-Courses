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
    
    func showAlert(with title: String, and message: String, completion: @escaping() -> Void = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
