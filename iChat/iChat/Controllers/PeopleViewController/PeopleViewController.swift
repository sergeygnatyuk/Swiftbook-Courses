//
//  PeopleViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 14.07.2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

final class PeopleViewController: UIViewController {
    
    // MARK: - Properties
    var users = [MUser]()
    private var userListener: ListenerRegistration?
    var collectionView: UICollectionView?
    var dataSource: UICollectionViewDiffableDataSource<SectionPeople, MUser>?
    private let currentUser: MUser
    
    // MARK: - Initialization
    init(currentUser: MUser) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
        title = currentUser.username
    }
    
    deinit {
        userListener?.remove()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupCollectionView()
        setupNavigationButton()
        createDataSource()
        userListener = ListenerService.shared.usersObserve(users: users, completion: { result in
            switch result {
            case .success(let users):
                self.users = users
                self.reloadData(with: nil)
            case .failure(let error):
                self.showAlert(with: "Error", and: error.localizedDescription)
            }
        })
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
        collectionView?.delegate = self
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
    
    private func setupNavigationButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(signOut))
    }
    
    private func setupAlertController() {
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (_) in
            do {
                try Auth.auth().signOut()
                UIApplication.shared.keyWindow?.rootViewController = AuthViewController()
            } catch {
                print("Error sign out: \(error.localizedDescription)")
            }
        }))
        present(alertController, animated: true, completion: nil)
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
    
    // MARK: - Actions
    @objc private func signOut() {
        setupAlertController()
    }
}
