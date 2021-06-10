//
//  AnotherExtension.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 22.05.2021.
//

import Foundation
import UIKit

extension UIFont {
    static let bigFont = UIFont(name: "Inter-SemiBold", size: 42)
    static let standartFont = UIFont(name: "Inter-SemiBold", size: 24)
    static let smallButtonFont = UIFont(name: "Inter-SemiBold", size: 16)
    static let smallLabelFont = UIFont(name: "Inter-Light", size: 14)
}

extension String
{
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}

extension Bundle {
    static func appName() -> String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }
        if let version : String = dictionary["CFBundleName"] as? String {
            return version
        } else {
            return ""
        }
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

extension UIViewController {
    func hideNavigationBar(){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)

    }

    func showNavigationBar() {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

class CheckBox: UIButton {
    
    private let checkedIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-checkbox")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let uncheckedIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-checkbox-null")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        checkedIcon.pin
            .size(24)
            .center()
        
        uncheckedIcon.pin
            .size(24)
            .center()
    }
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                checkedIcon.isHidden = false
                uncheckedIcon.isHidden = true
            } else {
                uncheckedIcon.isHidden = false
                checkedIcon.isHidden = true
            }
        }
    }
//        
//    @objc func buttonClicked(sender: UIButton) {
//        if sender == self {
//            isChecked = !isChecked
//        }
//    }
    
    private func setup() {
        [checkedIcon, uncheckedIcon].forEach { self.addSubview($0) }
        
//        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: .touchUpInside)
        self.isChecked = false
    }
}
