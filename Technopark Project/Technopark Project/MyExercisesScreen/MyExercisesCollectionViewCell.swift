//
//  MyExercisesCollectionViewCell.swift
//  Technopark Project
//
//  Created by Михаил Попов on 24.05.2021.
//

import Foundation
import UIKit
import PinLayout

final class MyExercisesCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .standartFont
        label.numberOfLines = 3
        label.textColor = .textColorLight
        return label
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
        
        titleLabel.pin
            .sizeToFit()
            .top(45)
            .hCenter()
    }
    
    func configure(with model: Exercises) {
        titleLabel.text = model.name
    }
    
    private func setup() {
        [titleLabel].forEach { addSubview($0) }
        
        layer.cornerRadius = 8
        backgroundColor = .buttonColor
        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
    }
}

