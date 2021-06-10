//
//  WordTabelViewCell.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 31.05.2021.
//

import Foundation
import PinLayout
import UIKit

final class WordTabelViewCell: UITableViewCell {
    
    private let titleButton: UILabel = {
        let label = UILabel()
        label.font = .smallButtonFont
        label.textAlignment = .center
        label.textColor = .textColorLight
        label.sizeToFit()
        return label
    }()
    
    private let settingButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .buttonColor
        button.layer.cornerRadius = 24
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 1
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        settingButton.pin
            .top()
            .horizontally()
            .height(48)
        
        titleButton.pin
            .all()

    }
    
    func configure(with model: String) {
        titleButton.text = model
    }
    
    private func setup() {
        [settingButton].forEach { addSubview($0) }
        settingButton.addSubview(titleButton)
        
        selectionStyle = .none
        backgroundColor = .clear
    }
}
