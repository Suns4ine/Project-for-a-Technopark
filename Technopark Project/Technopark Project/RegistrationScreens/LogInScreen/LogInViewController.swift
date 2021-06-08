//
//  LogInViewController.swift
//  Technopark Project
//
//  Created by Михаил Попов on 01.06.2021.
//

import Foundation
import PinLayout
import UIKit

class LogInViewController: UIViewController {
    
    private lazy var registrationHeadView = RegistrationHeadView(frame: .zero, root: self, model: .init(name: "Войти", subtitle: "Регистрация"))
    
    private let emailTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Почтовый адрес"
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
    
    private let passTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
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
    
    private let continueLabelButton: UILabel = {
        let label = UILabel()
        label.text = "Дальше"
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .smallButtonFont
        return label
    }()
       
    private let continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .buttonColor
        button.layer.cornerRadius = 24
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 1
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backGroundOtherColor
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        registrationHeadView.pin
            .height(143)
            .top()
            .horizontally(20)
        
        emailTextField.pin
            .below(of: registrationHeadView)
            .marginVertical(84)
            .width(336)
            .height(50)
            .left(20)
        
        passTextField.pin
            .below(of: emailTextField)
            .marginVertical(30)
            .width(336)
            .height(50)
            .left(20)
        
        continueButton.pin
            .height(50)
            .width(336)
            .below(of: passTextField)
            .marginVertical(42)
            .left(20)
        
        continueLabelButton.pin
            .center()
            .sizeToFit()
    }
    
    private func setup(){
        [registrationHeadView, emailTextField, passTextField, continueButton].forEach {
            view.addSubview($0)
        }
        continueButton.addSubview(continueLabelButton)
    }
}
