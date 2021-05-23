//
//  LessonCollectionViewCell.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 23.05.2021.
//

import Foundation
import UIKit
import PinLayout


final class LessonCollectionViewCell: UICollectionViewCell {
    
    private let volumeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fi-rr-volume")
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
        
        volumeIcon.pin
            .size(24)
            .top(12)
            .right(16)
        
    }
    
    func configure(with model: String) {
        
    }
    
    private func setup() {
        
        [volumeIcon].forEach { addSubview($0)}
        
        backgroundColor = .viewColor
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
    }
}
