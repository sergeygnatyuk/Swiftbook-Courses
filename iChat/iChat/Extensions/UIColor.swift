//
//  UIColor.swift
//  iChat
//
//  Created by Гнатюк Сергей on 05.07.2021.
//

import UIKit

extension UIColor {
    
    func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6 {
            return UIColor.black
        }
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16 ) / 255.0,
                            green: CGFloat((rgb & 0x00FF00) >> 8 ) / 255.0,
                            blue: CGFloat(rgb & 0x0000FF) / 255.0,
                            alpha: 1.0)
    }
    
    static func buttonRed() -> UIColor {
        return UIColor().colorFromHex("DB2023")
    }
    
    static func buttonWhite() -> UIColor {
        return UIColor().colorFromHex("D7F8FD")
    }
    
    static func mainWhite() -> UIColor {
        return UIColor().colorFromHex("F7F8FD")
    }
    
    static func buttonBlack() -> UIColor {
        return UIColor().colorFromHex("333333")
    }
    
    static func textFieldLight() -> UIColor {
        return UIColor().colorFromHex("E6E6E6")
    }
}
