//
//  Colors.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 14.05.2021.
//

import Foundation
import UIKit

extension UIColor {

    static let buttonColor = UIColor(hex: 0x9CB9D1)
    static let textColorLight = UIColor(hex: 0xE0E9F2)
    static let iconColor = UIColor(hex: 0xE0E9F2)
    static let viewColor = UIColor(hex: 0x9CB9D1)
    static let underlineColor = UIColor(hex: 0x9CB9D1)
    static let backGroundMainColor = UIColor(hex: 0x313844)
    static let backGroundLessonColor = UIColor(hex: 0x313844)
    static let backGroundOtherColor = UIColor(hex: 0x7087A4)
    static let backGroundSettingColor = UIColor(hex: 0x597387)
    static let errorColor = UIColor(hex: 0xcc0000)
    static let successColor = UIColor(hex: 0x3A9063)
    static let otherColor = UIColor(hex: 0xf0ff00)
    static let shadowColor = UIColor(hex: 0x06070D) //25%
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}

extension CGColor {

    class func colorWithHex(hex: Int) -> CGColor {

        return UIColor(hex: hex).cgColor

    }

}
