//
//  Constants.swift
//  ToDoList
//
//  Created by Iuliana Stecalovici on 05.05.2023.
//

import Foundation
import UIKit

class Constants{
    
    static var headerLabelFontSize: CGFloat = 24

    static var headerLabelLeftAnchor: CGFloat = 10
    
    static var headerLabelTopAnchor: CGFloat = 24
    
    static var headerLabelHeightAnchor: CGFloat = 29
    
    static var headerLabelBottomAnchor: CGFloat = 16
    
    static var headerLabelWidthAnchor: CGFloat = 250
    
    static var twoSections: Int = 2
    
    static var oneSection: Int = 1
    
    static var atributtedStringRange: Int = 0
    
    static var firstSection: Int = 0
    
    static var zeroTasks: Int = 0
    
    static var navigationTitleFont: UIFont = UIFont.boldSystemFont(ofSize: 40)
    
    static var editButtonColor = UIColor(named: "EditButtonYellow")
    
    static var deleteButtonColor = UIColor(named: "AccentColor")
    

    
}


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
