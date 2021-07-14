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
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium)
        guard let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfiguration) else { return }
        guard let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfiguration) else { return }
        
        viewControllers = [generateNavigationController(rootViewController: listViewController, title: "Conversation", image: conversationImage), generateNavigationController(rootViewController: peopleViewController, title: "People", image: peopleImage)]
    }
    
    // MARK: - Private
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
}
