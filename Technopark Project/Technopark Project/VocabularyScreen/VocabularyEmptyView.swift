//
//  VocabularyEmptyView.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 25.05.2021.
//

import Foundation
import UIKit
import PinLayout

final class VocabularyEmptyView: UIView {
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .standartFont
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let labelButton: UILabel = {
        let label = UILabel()
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .smallButtonFont
        return label
    }()
    
    private let addWordButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .buttonColor
        button.layer.cornerRadius = 24
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 1
        return button
    }()
    
    init(frame: CGRect, root: UIViewController, model: VocabularyModel) {
        super.init(frame: frame)
        
        titleLabel.text = "Добавьте первое слово"
        labelButton.text = "Добавить"
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.pin
            .top(32)
            .left(22)
            .right(22)
            .height(30)
        
        addWordButton.pin
            .below(of: titleLabel, aligned: .center)
            .marginVertical(71)
            .height(48)
            .width(self.frame.width * 0.3)
        
        labelButton.pin
            .all()
    }
    
    private func setup() {
        [titleLabel, addWordButton].forEach { addSubview($0)}
        addWordButton.addSubview(labelButton)
    }
}
