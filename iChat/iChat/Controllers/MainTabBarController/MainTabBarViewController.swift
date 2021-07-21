//
//  MainTabBarViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 14.07.2021.
//

import UIKit

final class MainTabBarViewController: UITabBarController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let listViewController = ListViewController()
        let peopleViewController = PeopleViewController()
        tabBar.tintColor = UIColor().colorFromHex("8E5AF7")
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium)
        guard let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfiguration) else { return }
        guard let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfiguration) else { return }
        
        viewControllers = [
            generateNavigationController(rootViewController: peopleViewController, title: "People", image: peopleImage),
            generateNavigationController(rootViewController: listViewController, title: "Conversation", image: conversationImage),
        ]
    }
    
    // MARK: - Private
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
}
