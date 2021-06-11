//
//  ChooseVocabularyCollectionViewCell.swift
//  Technopark Project
//
//  Created by Михаил Попов on 11.06.2021.
//

import Foundation
import UIKit
import PinLayout

final class ChooseVocabularyCollectionViewCell: UICollectionViewCell {
    
    private var cellPosition: Int!
    weak var delegate: ChooseVocabularyDelegate?
    private var vocabulary: Vocabulary!
    
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
    
    private let iconSuccses: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fi-rr-check")
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
        
        iconSuccses.image = iconSuccses.image?.tinted(with: .iconColor)
        
        if vocabulary.progress == 100 {
            vocabulary.succses = true
            titleLabel.textColor = .successColor
            subTitleLabel.textColor = .successColor
            iconSuccses.image = iconSuccses.image?.tinted(with: .successColor)
        }
        
        titleLabel.pin
            .sizeToFit()
            .top(45)
            .hCenter()
        
        subTitleLabel.pin
            .sizeToFit()
            .below(of: titleLabel)
            .margin(21)
            .hCenter()
        
        if vocabulary.succses == true {
            iconSuccses.pin
                .size(24)
                .top(8)
                .right(12.5)
        }
    }
    
    func configure(with model: Vocabulary, model position: Int) {
        vocabulary = model
        titleLabel.text = model.name
        subTitleLabel.text = "\(model.progress)%"
        cellPosition = position
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openLessonViewController))
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc
    private func openLessonViewController(position: Int) {
        delegate?.openLessonViewController(position: cellPosition)
    }
    
    private func setup() {
        [titleLabel, subTitleLabel, iconSuccses].forEach { addSubview($0) }
        
        layer.cornerRadius = 8
        backgroundColor = .buttonColor
        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
    }
}

protocol  ChooseVocabularyDelegate: AnyObject {
    func openLessonViewController(position: Int)
}