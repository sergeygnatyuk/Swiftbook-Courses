//
//  ExtensionMainViewController.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 01.05.2021.
//

import UIKit
import UserNotifications
import FirebaseAuth

//MARK: - Notifications
extension MainViewController {
    public func registerForNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (_, _) in
        }
    }
    public func postNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Download complete!"
        content.body = "Your background transfer has completed. File path: \(String(describing: filePath))"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "TransferComplete", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

//MARK: - Facebook SDK
extension MainViewController {
    public func checkLoggedIn() {
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
