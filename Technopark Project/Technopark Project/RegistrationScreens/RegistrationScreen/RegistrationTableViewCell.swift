//
//  RegistrationTableViewCell.swift
//  Technopark Project
//
//  Created by Михаил Попов on 03.06.2021.
//

import Foundation
import UIKit
import PinLayout

final class RegistrationTableViewCell: UITableViewCell {
    
    private let textField:UITextField = {
        let textField = UITextField()
        textField.font = .standartFont
        textField.textColor = .darkText
        textField.textAlignment = .left
        textField.backgroundColor = .textColorLight
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = .borderColor
        textField.textOffset(size: 20)
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: RegistrationViewModel) {
        textField.placeholder = model.nameCell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textField.pin
            .height(50)
            .width(336)
            .bottom()
            .left(20)
    }
    
    private func setup(){
        contentView.addSubview(textField)
    }
}
