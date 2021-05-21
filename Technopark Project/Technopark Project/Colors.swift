//
//  Colors.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 14.05.2021.
//

import Foundation
import UIKit

    let buttonColor = 0x9CB9D1
    let textColorLight = 0xE0E9F2
    let iconColor = 0xE0E9F2
    let viewColor = 0
    let underlineColor = 0
    let backGroundMainColor = 0x313844
    let backGroundOtherColor = 0x7087A4
    let backGroundSettingColor = 0x597387
    let errorColor = 0xcc0000
    let successColor = 0x3A9063
    let otherColor = 0xf0ff00
    let shadowColor = 0x06070D //25%

extension UIColor {

    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }

    var buttonColor: UIColor { return UIColor(hex: 0x9CB9D1) }
    var textColor: UIColor { return UIColor(hex: 0xE0E9F2) }
    
}

extension CGColor {

    class func colorWithHex(hex: Int) -> CGColor {

        return UIColor(hex: hex).cgColor

    }

}

extension UIImage {
    func tinted(with color: UIColor, isOpaque: Bool = false) -> UIImage? {
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: size, format: format).image { _ in
            color.set()
            withRenderingMode(.alwaysTemplate).draw(at: .zero)
        }
    }
}
