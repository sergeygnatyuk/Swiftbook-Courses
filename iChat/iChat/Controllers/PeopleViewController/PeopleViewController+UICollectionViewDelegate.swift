//
//  PeopleViewController+UICollectionViewDelegate.swift
//  iChat
//
//  Created by Гнатюк Сергей on 02.09.2021.
//

import UIKit

extension PeopleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let user = self.dataSource?.itemIdentifier(for: indexPath) else { return }
        let profileViewController = ProfileViewController(user: user)
        present(profileViewController, animated: true, completion: nil)
    }
}
