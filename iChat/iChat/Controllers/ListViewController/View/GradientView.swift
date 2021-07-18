//
//  GradientView.swift
//  iChat
//
//  Created by Гнатюк Сергей on 18.07.2021.
//

import UIKit

class GradientView: UIView {
    
    // MARK: - Properties
    private let gradientLayer = CAGradientLayer()
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setupGradientColor(startColor: startColor, endColor: endColor)
        }
    }
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setupGradientColor(startColor: startColor, endColor: endColor)
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(from: Point, to: Point, startColor: UIColor?, endColor: UIColor?) {
        self.init()
        setupGradient(from: from, to: to, startColor: startColor, endColor: endColor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient(from: .leading, to: .trailing, startColor: startColor, endColor: endColor)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    // MARK: - Private
    private func setupGradient(from: Point, to: Point, startColor: UIColor?, endColor: UIColor?) {
        layer.addSublayer(gradientLayer)
        setupGradientColor(startColor: startColor, endColor: endColor)
        gradientLayer.startPoint = from.point
        gradientLayer.endPoint = to.point
    }
    
    private func setupGradientColor(startColor: UIColor?, endColor: UIColor?) {
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
}
