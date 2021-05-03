//
//  ExtensionMainViewController.swift
//  MyPlaces
//
//  Created by Гнатюк Сергей on 03.05.2021.
//

import Foundation
import RealmSwift

extension MainViewController: UISearchResultsUpdating {
    
   public func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredPlaces = places.filter("name CONTAINS[c] %@ OR location CONTAINS[c] %@", searchText,searchText)
        tableView.reloadData()
    }
}
