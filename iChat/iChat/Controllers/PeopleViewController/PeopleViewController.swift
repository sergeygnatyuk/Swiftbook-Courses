//
//  PeopleViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 14.07.2021.
//

import UIKit

final class PeopleViewController: UIViewController {
    
    // MARK: - Properties
    let users = Bundle.main.decode([MUser].self, from: "users.json")
    var collectionView: UICollectionView?
    var dataSource: UICollectionViewDiffableDataSource<SectionPeople, MUser>?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupCollectionView()
        createDataSource()
        reloadData(with: nil)
    }
    
    // MARK: - Private
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView?.backgroundColor = .mainWhite()
        guard let collectionsView = collectionView else { return }
        view.addSubview(collectionsView)
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseId)
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
    
    // MARK: - Public
    public func reloadData(with searchText: String?) {
        let filtered = users.filter { (user) -> Bool in
            user.contains(filter: searchText)
        }
        var snapShot = NSDiffableDataSourceSnapshot<SectionPeople, MUser>()
        snapShot.appendSections([.users])
        snapShot.appendItems(filtered, toSection: .users)
        dataSource?.apply(snapShot, animatingDifferences: true)
    }
}

// MARK: - SwiftUI
import SwiftUI

struct PeopleViewControllerProvider: PreviewProvider {
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
