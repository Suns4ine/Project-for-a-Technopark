//
//  HeaderWordView.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 28.05.2021.
//

import Foundation
import PinLayout
import UIKit

final class HeaderWordView: UIView {
    
    private let backButton = UIButton()
    
    private let backIcon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-arrow-left 1")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
//    private let settingIcon: UIImageView = {
//       let icon = UIImageView()
//        icon.image = UIImage(named: "fi-rr-settings")
//        icon.image = icon.image?.tinted(with: .iconColor)
//        return icon
//    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .standartFont
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
//    private let toShareIcon: UIImageView = {
//        let icon = UIImageView()
//        icon.image = UIImage(named: "fi-rr-share 1")
//        icon.image = icon.image?.tinted(with: .iconColor)
//        return icon
//    }()
    
    init(frame: CGRect, root: UIViewController, model: Vocabulary) {
        super.init(frame: frame)
        
        titleLabel.text = model.name
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backIcon.pin
            .size(24)
            .center()
        
        backButton.pin
            .size(24)
            .left(21)
            .top(57)
        
//        settingIcon.pin
//            .size(24)
//            .right(18)
//            .top(57)
//
//        toShareIcon.pin
//            .size(24)
//            .top(57)
//            .before(of: settingIcon)
//            .marginHorizontal(20)
        
        titleLabel.pin
            .sizeToFit()
            .top(53)
            .hCenter()
        
    }
    
    private func setup () {
        [backButton, titleLabel].forEach{ addSubview($0) }
        backButton.addSubview(backIcon)
    }
}
