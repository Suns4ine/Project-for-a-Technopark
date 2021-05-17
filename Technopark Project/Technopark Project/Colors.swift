//
//  Colors.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 14.05.2021.
//

import Foundation
import UIKit

enum Color: String {
    case button = "9CB9D1"
    case text = "E0E9F2"
    case icon
    case view
    case underline
    case backGroundMain = "313844"
    case backGroundOther = "7087A4"
    case backGroundSetting = "597387"
    case error = "cc0000"
    case success = "3A9063"
    case other = "f0ff00"
}

extension UIColor {

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
