//
//  HeaderView.swift
//  Technopark Project
//
//  Created by Михаил Попов on 04.06.2021.
//

import Foundation
import PinLayout
import UIKit

final class HeaderView: UIView {
    
    weak var delegate: HeaderDelegate?
    
    private let backButton = UIButton()
    private let settingButton = UIButton()
    
    private let backIcon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-arrow-left 1")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let settingIcon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-settings")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let crossIcon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-cross 1")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .standartFont
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    init(frame: CGRect, root: UIViewController, model: HeaderModel) {
        super.init(frame: frame)
        
        titleLabel.text = model.name
        
        backButton.isHidden = model.backButtonIsHidden
        settingButton.isHidden = model.settingButtonIsHidden
        
        backButton.isEnabled = model.backButtonIsHidden
        settingButton.isEnabled = model.settingButtonIsHidden
        
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
        
        settingIcon.pin
            .size(24)
            .center()
        
        backButton.pin
            .size(24)
            .left(21)
            .vCenter()
        
        settingButton.pin
            .size(24)
            .right(21)
            .vCenter()
        
        titleLabel.pin
            .center()
            .height(60)
            .width(180)
        
    }
    
    private func setup () {
        
        backButton.addSubview(backIcon)
        settingButton.addSubview(settingIcon)
        
        [backButton, settingButton, titleLabel].forEach{
            self.addSubview($0)
        }
        
        backButton.addTarget(self, action: #selector(moveBack), for: .touchUpInside)
        settingButton.addTarget(self, action: #selector(deleteObjects), for: .touchUpInside)
    }
    
    @objc
    private func moveBack() {
        delegate?.moveBack?()
    }
    
    @objc
    private func deleteObjects() {
        delegate?.deleteObjects?()
    }
    
}

@objc
protocol  HeaderDelegate: AnyObject {
    @objc optional func moveBack()
    @objc optional func deleteObjects()
}

protocol PopDelegate: AnyObject {
    func didFinishVC(controller: UIViewController)
}
