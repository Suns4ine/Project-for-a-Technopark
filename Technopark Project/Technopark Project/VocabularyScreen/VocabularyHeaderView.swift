//
//  VocabularyHeaderView.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 24.05.2021.
//

import Foundation
import PinLayout
import UIKit

final class VocabularyHeaderView: UIView {
    
    private var vocabulary: Vocabulary!
    
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
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .standartFont
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let statisticIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-stats 1")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    init(frame: CGRect, root: UIViewController, model: VocabularyModel) {
        super.init(frame: frame)
        
        titleLabel.text = model.name
        vocabulary = model.vocabulary
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
            .top(57)
        
        settingIcon.pin
            .size(24)
            .right(18)
            .top(57)
        
        if !vocabulary.words.isEmpty {
            statisticIcon.pin
                .size(24)
                .top(57)
                .before(of: settingIcon)
                .marginHorizontal(20)
        }
        
        titleLabel.pin
            .top(43)
            .height(29)
            .after(of: backIcon)
            .before(of: vocabulary.words.isEmpty ? settingIcon : statisticIcon)
            .margin(10)
        
    }
    
    private func setup () {
        [backIcon, settingIcon, titleLabel, statisticIcon].forEach{
            addSubview($0)
        }
    }
}
