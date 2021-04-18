//
//  MainViewController.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 11.04.2021.
//

import UIKit
import UserNotifications
import FBSDKLoginKit
import FirebaseAuth

enum Actions: String, CaseIterable {
    case downloadImage = "Download Image"
    case get = "GET"
    case post = "POST"
    case ourCourses = "Our Courses"
    case uploadImage = "Upload Image"
    case downloadFile = "Download File"
    case ourCoursesAlamofire = "Our Courses (Alamofire)"
    case responseData = "responseData"
    case responseString = "responseString"
    case response = "response"
    case downloadLargeImage = "Download Large Image"
    case postAlamofire = "POST with Alamofire"
    case putRequest = "PUT Request with Alamofire"
    case uploadImageAlamofire = "Upload Image (Alamofire)"
}

let loginVCIdentifier = "LoginViewController"
private let cellIdentifier = "Cell"
private let downloadImageSegue = "ShowImage"
private let responseDataSegue = "ResponseData"
private let ourCoursesAlamofireSegue = "OurCoursesAlamofire"
private let ourCoursesSegue = "OurCourses"
private let downloadLargeImageSegue = "LargeImage"
private let postRequestSegue = "PostRequest"
private let putRequestSegue = "PutRequest"
private let url = "https://jsonplaceholder.typicode.com/posts"
private let uploadImage = "https://api.imgur.com/3/image"
private let swiftbookApi = "https://swiftbook.ru//wp-content/uploads/api/api_courses"


class MainViewController: UICollectionViewController {
    
    private let actions = Actions.allCases
    private var alert: UIAlertController!
    private let dataProvider = DataProvider()
    private var filePath: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForNotification()
        
        dataProvider.fileLocation = { (location) in
            
            //save file for use
            print("Download finished: \(location.absoluteString)")
            self.filePath = location.absoluteString
            self.postNotification()
            self.alert.dismiss(animated: false, completion: nil)
            
        }
        
        checkLoggedIn()
    }
    
    private func showAlert() {
        alert = UIAlertController(title: "Downloading...",
                                  message: "0%",
                                  preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
                   
                   self.dataProvider.stopDownload()
               }
        
        let height = NSLayoutConstraint(item: alert.view as Any,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 0,
                                       constant: 170)
        
        alert.view.addConstraint(height)
        
       
        
        alert.addAction(cancelAction)
        present(alert, animated: true) {
            
            let size = CGSize(width: 40, height: 40)
            let point = CGPoint(x: self.alert.view.frame.width / 2 - size.width / 2,
                                y: self.alert.view.frame.height / 2 - size.height / 2)
            
            let activityIndicator = UIActivityIndicatorView(frame: CGRect(origin: point,
                                                                          size: size))
            activityIndicator.color = .gray
            activityIndicator.startAnimating()
            
            let progressView = UIProgressView(frame: CGRect(x: 0,
                                                            y: self.alert.view.frame.height - 44,
                                                            width: self.alert.view.frame.width,
                                                            height: 2))
            progressView.tintColor = .blue
            
            self.dataProvider.onProgress = { (progress) in
                progressView.progress = Float(progress)
                self.alert.message = String(Int(progress * 100)) + "%"
            }
            
            self.alert.view.addSubview(activityIndicator)
            self.alert.view.addSubview(progressView)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return actions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        cell.label.text = actions[indexPath.row].rawValue
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let action = actions[indexPath.row]
        
        switch action {
        case .downloadImage:
            performSegue(withIdentifier: downloadImageSegue, sender: self)
        case .get:
            NetworkManager.getRequest(url: url)
        case .post:
            NetworkManager.postRequest(url: url)
        case .ourCourses:
            performSegue(withIdentifier: ourCoursesSegue, sender: self)
        case .uploadImage:
            NetworkManager.uploadImage(url: uploadImage)
        case .downloadFile:
            dataProvider.startDownload()
            showAlert()
        case .ourCoursesAlamofire:
            performSegue(withIdentifier: ourCoursesAlamofireSegue, sender: self)
        case .responseData:
            performSegue(withIdentifier: responseDataSegue, sender: self)
        case .responseString:
            AlamofireNetworkRequest.responseString(url: swiftbookApi)
        case .response:
            AlamofireNetworkRequest.response(url: swiftbookApi)
        case .downloadLargeImage:
            performSegue(withIdentifier: downloadLargeImageSegue, sender: self)
        case .postAlamofire:
            performSegue(withIdentifier: postRequestSegue, sender: self)
        case .putRequest:
            performSegue(withIdentifier: putRequestSegue, sender: self)
        case .uploadImageAlamofire:
            AlamofireNetworkRequest.uploadImage(url: uploadImage)
        }
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let coursesVC = segue.destination as? CoursesViewController
        let imageVC = segue.destination as? ImageViewController
        
        switch segue.identifier {
        case ourCoursesSegue:
            coursesVC?.fetchData()
        case ourCoursesAlamofireSegue:
            coursesVC?.fetchDataWithAlamofire()
        case downloadImageSegue:
            imageVC?.fetchImage()
        case responseDataSegue:
            imageVC?.fetchDataWithAlamofire()
            AlamofireNetworkRequest.responseData(url: swiftbookApi)
        case downloadLargeImageSegue:
            imageVC?.downloadImageWithProgress()
        case postRequestSegue:
            coursesVC?.postRequest()
        case putRequestSegue:
            coursesVC?.putRequest()
        default:
            break
        }
    }
}

extension MainViewController {
    
    private func registerForNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (_, _) in
        
        }
    }
    
    private func postNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "Download complete!"
        content.body = "Your background transfer has completed. File path: \(String(describing: filePath))"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: "TransferComplete", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
}

//MARK: Facebook SDK

extension MainViewController {
    private func checkLoggedIn() {
        if Auth.auth().currentUser == nil {
            
            DispatchQueue.main.async {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyBoard.instantiateViewController(identifier: loginVCIdentifier) as! LoginViewController
                self.present(loginViewController, animated: true)
                return
            }
        }
    }
}
