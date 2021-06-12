//
//  CoursesViewController.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 10.04.2021.
//

import UIKit

final class CoursesViewController: UIViewController {
    
    // Properties
    private let url = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    private let postRequestUrl = "https://jsonplaceholder.typicode.com/posts"
    private let putRequestUrl = "https://jsonplaceholder.typicode.com/posts/1"
    public var courses = [Course]()
    public var courseName: String?
    public var courseURL: String?
    var alamofireNetworkRequest = AlamofireNetworkRequest()
    
    // UI
    @IBOutlet var tableView: UITableView!
    
    //MARK: - Public
    public func fetchData() {
        NetworkManager.fetchData(url: url) { (courses) in
            self.courses = courses
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    public func fetchDataWithAlamofire() {
        alamofireNetworkRequest.sendRequest(url: url) { (courses) in
            self.courses = courses
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    public func postRequest() {
        alamofireNetworkRequest.postRequest(url: postRequestUrl) { (courses) in
            self.courses = courses
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    public func putRequest() {
        alamofireNetworkRequest.putRequest(url: putRequestUrl) { (courses) in
            self.courses = courses
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    public func configureCell(cell: TableViewCell, for indexPath: IndexPath) {
        let course = courses[indexPath.row]
        cell.courseNameLabel.text = course.name
        if let numberOfLessons = course.numberOfLessons{
            cell.numberOfLessons.text = "Number of lessons: \(numberOfLessons)"
        }
        if let numberOfTests = course.numberOfTests {
            cell.numberOfTests.text = "Number of tests: \(numberOfTests)"
        }
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: course.imageUrl!) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                cell.courseImage.image = UIImage(data: imageData)
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webViewController = segue.destination as! WebViewController
        webViewController.selectedCourse = courseName
        if let url = courseURL {
            webViewController.courseURL = url
        }
    }
}



