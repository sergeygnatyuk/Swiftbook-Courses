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
                return self.configure(collectionView: collectionView, cellType: ActiveChatCell.self, with: chat, for: indexPath)
            case .waitingChats:
                return self.configure(collectionView: collectionView, cellType: WaitingChatCell.self, with: chat, for: indexPath)
            }
        })
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as? SectionHeader else { fatalError("Can Not Create new section Header") }
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown Section Kind") }
            sectionHeader.configure(text: section.description(), font: .laoSangamMN20(), textColor: UIColor().colorFromHex("929292"))
            return sectionHeader
        }
    }
}
