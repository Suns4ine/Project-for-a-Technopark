//
//  HeaderView.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 21.05.2021.
//

import Foundation
import UIKit
import PinLayout

final class HeaderView: UIView {
    
    private let buttonSetting = UIButton()
    private let labelNamed: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: textColorLight)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    private var account: Account?
    private let iconAccount: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fi-rr-user 1")
        imageView.image = imageView.image?.tinted(with: UIColor(hex: iconColor))
        return imageView
    }()
    
    
    init(frame: CGRect, account: Account?) {
        self.account = account
        super.init(frame: frame)
        
        backgroundColor = UIColor(hex: backGroundOtherColor)
        layer.shadowColor = UIColor(hex: shadowColor).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
        setup()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        labelNamed.font = UIFont(name: "Inter-SemiBold", size: 24)
        //buttonSetting.backgroundColor = .green
        labelNamed.text = account != nil ? "\(String(describing: account!.firstName)) \(String(describing: account!.lastName))" : "Бебра"
        
        buttonSetting.pin
            .top(35)
            .left(19)
            .right(19)
            .bottom(5)
        
        labelNamed.pin
            .height(buttonSetting.frame.height - 12)
            .width(buttonSetting.frame.width - 10 - iconAccount.frame.width)
            //.size(buttonSetting.frame.width - 10)
            //.sizeToFit()
            .top()
            .hCenter()
        
        if account != nil {
            iconAccount.pin
                .size(24)
                .left(8)
                .bottom(41)
        }
    }
    
    private func setup() {
        
        self.addSubview(buttonSetting)
        
        [iconAccount, labelNamed].forEach {
            buttonSetting.addSubview($0)
        }
    }
}
