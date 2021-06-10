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
    
    weak var delegate: HeaderDelegate?
    
    private let backButton = UIButton()
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backButton.pin
            .size(24)
            .left(21)
            .top(13)
        
        backIcon.pin
            .size(24)
            .center()
        
        progressView.pin
            .top(22)
            .after(of: backIcon)
            .marginHorizontal(31)
            .height(6)
            .width(224)
            
    }
    
    private func setup() {
        [backIcon, progressView].forEach { self.addSubview($0) }
        
        backButton.addSubview(backIcon)
        backButton.addTarget(self, action: #selector(moveBack), for: .touchUpInside)
    }
    
    func configure(with model: String) {
        
    }
    
    @objc
    private func moveBack() {
        delegate?.moveBack?()
    }
    
}
