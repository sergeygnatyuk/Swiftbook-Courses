//
//  SceneDelegate.swift
//  iChat
//
//  Created by Гнатюк Сергей on 05.07.2021.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        if let user = Auth.auth().currentUser {
            FirestoreService.shared.getUsersData(user: user) { result in
                switch result {
                case .success(let muser):
                    self.window?.rootViewController = MainTabBarViewController()
                case .failure(let error):
                    self.window?.rootViewController = AuthViewController()
                }
            }
        } else {
            window?.rootViewController = AuthViewController()
        }
        window?.makeKeyAndVisible()
    }
}

