//
//  PeopleViewController+UISearchBarDelegate.swift
//  iChat
//
//  Created by Гнатюк Сергей on 14.07.2021.
//

import UIKit

extension PeopleViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadData(with: searchText)
    }
}
