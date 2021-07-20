//
//  ListViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 14.07.2021.
//

import UIKit

final class ListViewController: UIViewController {
    
    // MARK: - Properties
    var collectionView: UICollectionView?
    var dataSource: UICollectionViewDiffableDataSource<Section, MChat>?
    let activeChats = Bundle.main.decode([MChat].self, from: "activeChats.json")
    let waitingChats = Bundle.main.decode([MChat].self, from: "waitingChats.json")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSearchBar()
        createDataSource()
        reloadData()
    }
    
    // MARK: - Private
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView?.backgroundColor = .mainWhite()
        guard let collectionsView = collectionView else { return }
        view.addSubview(collectionsView)
        collectionView?.register(ActiveChatCell.self, forCellWithReuseIdentifier: Identifiers.activeChatCell)
        collectionView?.register(WaitingChatCell.self, forCellWithReuseIdentifier: Identifiers.waitingChatCell)
        collectionView?.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
    }
    
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    private func reloadData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapShot.appendSections([.waitingChats, .activeChats])
        snapShot.appendItems(waitingChats, toSection: .waitingChats)
        snapShot.appendItems(activeChats, toSection: .activeChats)
        
        dataSource?.apply(snapShot, animatingDifferences: true)
    }
}

// MARK: - SwiftUI
import SwiftUI

struct ListViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = MainTabBarViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
