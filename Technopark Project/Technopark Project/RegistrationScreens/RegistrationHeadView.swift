//
//  RegistrationHeadView.swift
//  Technopark Project
//
//  Created by Михаил Попов on 01.06.2021.
//

import Foundation
import PinLayout
import UIKit

final class RegistrationHeadView: UIView {
    
    private let backButton = UIButton()
    private let secondButton = UIButton()
    
    private let crossIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fi-rr-cross 1")
        imageView.image = imageView.image?.tinted(with: .iconColor)
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .standartFont
        return label
    }()
    
    private let labelButton: UILabel = {
        let label = UILabel()
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .smallButtonFont
        return label
    }()
    
    init(frame: CGRect, root: UIViewController, model: HeadRegistrationModel) {
        super.init(frame: frame)
        self.backgroundColor = .backGroundOtherColor
        
        titleLabel.text = model.name
        labelButton.text = model.subtitle
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        crossIcon.pin
            .size(24)
            .center()
        
        backButton.pin
            .top(112)
            .left()
            .size(24)
            .vCenter()
        
        titleLabel.pin
            .top(107)
            .after(of: backButton)
            .marginHorizontal(99)
            .height(36)
            .sizeToFit()
        
        labelButton.pin
            .center()
            .sizeToFit()
        
        secondButton.pin
            .height(24)
            .width(100)
            .top(112)
            .right()
    }
    
    private func setup(){
        [backButton, secondButton, titleLabel].forEach {
            self.addSubview($0)
        }
        backButton.addSubview(crossIcon)
        secondButton.addSubview(labelButton)
        
        backButton.addTarget(self, action: #selector(moveBack), for: .touchUpInside)
    }
    
    @objc
    private func moveBack(){
        
    }
}

