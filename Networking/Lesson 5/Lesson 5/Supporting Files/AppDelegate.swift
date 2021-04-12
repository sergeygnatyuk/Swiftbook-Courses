//
//  AppDelegate.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 09.04.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var bgSessionCompletionHandler: (() -> ())?


    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        bgSessionCompletionHandler = completionHandler
    }

}

