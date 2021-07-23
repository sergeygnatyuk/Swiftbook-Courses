//
//  ProfileViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 23.07.2021.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    let containerView: ContainerView = {
        let containerView = ContainerView()
        return containerView
    }()


    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.setupConstraints()
    }
}

// MARK: - SwiftUI
import SwiftUI

struct ProfileViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
