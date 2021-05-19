//
//  MainViewController.swift
//  Lesson 2 MyPlaces
//
//  Created by Гнатюк Сергей on 14.03.2021.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Dependencies
    private let searchController = UISearchController(searchResultsController: nil)
    public var places: Results<Place>!
    public var filteredPlaces: Results<Place>!
    
    // Properties
    private let cellIdentifier = "Cell"
    private let titleDelete = "Delete"
    private let showDetailIdentifierSegue = "showDetail"
    private let keyPathDate = "date"
    private let keyPathName = "name"
    private let search = "Search"
    private var ascendingSorting = true
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    // UI
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var reversedSortingButton: UIBarButtonItem!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        places = realm.objects(Place.self)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = search
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredPlaces.count
        }
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        let place = isFiltering ? filteredPlaces[indexPath.row] : places[indexPath.row]
        cell.nameLabel?.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        cell.imageOfPlace.image = UIImage(data: place.imageData!)
        cell.cosmosView.rating = place.rating
        return cell
    }
    
    //MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let place = places[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: titleDelete) { (contextualAction, view, boolValue) in
            StorageManager.deletObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeActions
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showDetailIdentifierSegue {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let place = isFiltering ? filteredPlaces[indexPath.row] : places[indexPath.row]
            
            let newPlaceViewController = segue.destination as! NewPlaceViewController
            newPlaceViewController.currentPlace = place
        }
    }
    
    // MARK: - Actions
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        guard let newPlaceViewController = segue.source as? NewPlaceViewController else { return }
        newPlaceViewController.savePlace()
        tableView.reloadData()
    }
    
    @IBAction func sortSelection(_ sender: UISegmentedControl) {
        sorting()
    }
    
    @IBAction func reversedSorting(_ sender: Any) {
        ascendingSorting.toggle()
        if ascendingSorting {
            reversedSortingButton.image = #imageLiteral(resourceName: "icons8-стрелки-сортировки-64")
        }else{
            reversedSortingButton.image = #imageLiteral(resourceName: "icons8-стрелки-сортировки-64")
        }
        sorting()
    }
    
    //MARK: - Private
    private func sorting() {
        if segmentedControl.selectedSegmentIndex == 0 {
            places = places.sorted(byKeyPath: keyPathDate, ascending: ascendingSorting)
        }else{
            places = places.sorted(byKeyPath: keyPathName, ascending: ascendingSorting)
        }
        tableView.reloadData()
    }
}










