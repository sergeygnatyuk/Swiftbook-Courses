//
//  PeopleViewController+DataSource.swift
//  iChat
//
//  Created by Гнатюк Сергей on 21.07.2021.
//

import UIKit

extension PeopleViewController {
    
    func createDataSource() {
        guard let collection = collectionView else { return }
        dataSource = UICollectionViewDiffableDataSource<SectionPeople, MUser>(collectionView: collection, cellProvider: { (collectionView, indexPath, user) -> UICollectionViewCell in
            guard let section = SectionPeople(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            switch section {
            case .users:
                let cell = collection.dequeueReusableCell(withReuseIdentifier: Identifiers.activeChatCell, for: indexPath)
                cell.backgroundColor = .cyan
                return cell
            }
        })
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as? SectionHeader else { fatalError("Can Not Create new section Header") }
            guard let section = SectionPeople(rawValue: indexPath.section) else { fatalError("Unknown Section Kind") }
            let items = self.dataSource?.snapshot().itemIdentifiers(inSection: .users)
            sectionHeader.configure(text: section.description(usersCount: items?.count ?? 11), font: .systemFont(ofSize: 36,weight: .light), textColor: .label)
            return sectionHeader
        }
    }
}
