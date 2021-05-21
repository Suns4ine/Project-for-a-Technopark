//
//  MainCollectionViewCell.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 21.05.2021.
//

import Foundation
import UIKit
import PinLayout

final class MainCollectionViewCell: UICollectionViewCell {
    
    private var succses = false
    private var vocabulary = false
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let iconSuccses: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fi-rr-check")
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(hex: buttonColor)
        self.layer.cornerRadius = 8
        layer.shadowColor = UIColor(hex: shadowColor).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [titleLabel, subTitleLabel, iconSuccses].forEach {
            addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if succses == true {
            
            titleLabel.textColor = UIColor(hex: successColor)
            subTitleLabel.textColor = UIColor(hex: successColor)
            iconSuccses.image = iconSuccses.image?.tinted(with: UIColor(hex: successColor))
        } else {
            titleLabel.textColor = UIColor(hex: textColorLight)
            subTitleLabel.textColor = UIColor(hex: textColorLight)
        }
        titleLabel.font = UIFont(name: "Inter-SemiBold", size: 24)
        titleLabel.numberOfLines = 3
        subTitleLabel.font = UIFont(name: "Inter-SemiBold", size: 24)
        subTitleLabel.numberOfLines = 1
        
        titleLabel.pin
            .sizeToFit()
            .top(45)
            .hCenter()
        
        if vocabulary == true {
        subTitleLabel.pin
            .sizeToFit()
            .below(of: titleLabel)
            .margin(21)
            .hCenter()
        }
        
        if succses == true && vocabulary == true {
            iconSuccses.pin
                .size(24)
                .top(8)
                .right(12.5)
        }
    }
    
    func configure(with model: EducationalMaterial) {
        switch model {
        case .vocabulary(let vocobulary):
            titleLabel.text = vocobulary.name
            subTitleLabel.text = "\(vocobulary.status)%"
            succses = vocobulary.succses
            vocabulary = true
        case .exercises(let exercises):
            titleLabel.text = exercises.name
        default:
            break
        }
    }

}
