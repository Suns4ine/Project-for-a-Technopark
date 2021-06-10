//
//  CollectionDeleteVocabulariesViewCell.swift
//  Technopark Project
//
//  Created by Михаил Попов on 10.06.2021.
//

import Foundation
import UIKit
import PinLayout

final class CollectionDeleteVocabulariesViewCell: UICollectionViewCell {
    
    private let checkbox = CheckBox()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .standartFont
        label.numberOfLines = 3
        label.textColor = .textColorLight
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .standartFont
        label.numberOfLines = 1
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
        
        subTitleLabel.pin
            .sizeToFit()
            .below(of: titleLabel)
            .margin(21)
            .hCenter()
        
        checkbox.pin
            .size(24)
            .top(8)
            .right(12.5)
    }
    
    func configure(with model: Vocabulary, model position: Int) {
        titleLabel.text = model.name
        subTitleLabel.text = "\(model.progress)%"
    }
    
    private func setup() {
        [titleLabel, subTitleLabel, checkbox].forEach { addSubview($0) }
        
        layer.cornerRadius = 8
        backgroundColor = .buttonColor
        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
    }
}
