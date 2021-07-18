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
                return self.configure(cellType: WaitingChatCell.self, with: chat, for: indexPath)
            }
        })
    }
    
    func configure<T: SelfConfiguringCellProtocol>(cellType: T.Type, with value: MChat, for indexPath: IndexPath) -> T {
        guard let cell = collectionView?.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
        cell.configure(with: value)
        return cell
    }
}
