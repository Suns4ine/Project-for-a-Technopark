//
//  LessonHeaderView.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 23.05.2021.
//

import Foundation
import UIKit
import PinLayout

final class LessonHeaderView: UIView {
    
    private let progressView: UIView = {
        let view = UIView()
        view.backgroundColor = .iconColor
        view.layer.cornerRadius = 3
        return view
    }()
    
    private let backIcon:  UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fi-rr-arrow-left 1")
        imageView.image = imageView.image?.tinted(with: .iconColor)
        return imageView
    }()
    private let settingIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fi-rr-settings")
        imageView.image = imageView.image?.tinted(with: .iconColor)
        return imageView
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
        
        backIcon.pin
            .size(24)
            .left(21)
            .top(13)

        settingIcon.pin
            .size(24)
            .right(18)
            .top(13)
        
        progressView.pin
            .top(22)
            .after(of: backIcon)
            .marginHorizontal(31)
            .before(of: settingIcon)
            .marginHorizontal(33)
            .height(6)
            
    }
    
    private func setup() {
        [backIcon, progressView, settingIcon].forEach { self.addSubview($0) }
    }
    
    func configure(with model: String) {
        
    }
    
    
}
