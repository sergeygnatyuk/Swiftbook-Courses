//
//  ChatRequestViewController.swift
//  iChat
//
//  Created by Гнатюк Сергей on 25.07.2021.
//

import UIKit

final class ChatRequestViewController: UIViewController {
    
    // MARK: - Properties
    let containerView: ChatRequestView = {
        let containerView = ChatRequestView()
        return containerView
    }()

    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.backgroundColor = .mainWhite()
        containerView.setupConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        containerView.acceptButton.applyGradients(cornerRadius: 10)
    }
}
