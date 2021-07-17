//
//  ListViewController+DataSource.swift
//  iChat
//
//  Created by Гнатюк Сергей on 17.07.2021.
//

import UIKit

extension ListViewController {
    // MARK: - DataSource
    func createDataSource() {
        guard let collection = collectionView else { return }
        dataSource = UICollectionViewDiffableDataSource<Section, MChat>(collectionView: collection, cellProvider: { (collectionView, indexPath, chat) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            switch section {
            case .activeChats:
                return self.configure(cellType: ActiveChatCell.self, with: chat, for: indexPath)
            case .waitingChats:
                let cell = collection.dequeueReusableCell(withReuseIdentifier: Identifiers.listCellIdSecond, for: indexPath)
                cell.backgroundColor = .cyan
                return cell
            }
        })
    }
    
    func configure<T: SelfConfiguringCell>(cellType: T.Type, with value: MChat, for indexPath: IndexPath) -> T {
        guard let cell = collectionView?.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
        cell.configure(with: value)
        return cell
    }
}
