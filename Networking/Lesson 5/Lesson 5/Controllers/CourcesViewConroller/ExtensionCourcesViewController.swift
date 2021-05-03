//
//  ExtensionCourcesViewController.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 01.05.2021.
//

import UIKit

// MARK: - TableViewDataSource

extension CoursesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        configureCell(cell: cell, for: indexPath)
        return cell
    }
}

// MARK: - TableViewDelegate

extension CoursesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = courses[indexPath.row]
        let identifierSegue = "Description"
        courseURL = course.link
        courseName = course.name
        performSegue(withIdentifier: identifierSegue, sender: self)
    }
}
