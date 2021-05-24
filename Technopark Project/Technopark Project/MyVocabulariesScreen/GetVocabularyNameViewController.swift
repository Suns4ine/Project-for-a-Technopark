//
//  GetVocabularyNameViewController.swift
//  Technopark Project
//
//  Created by Михаил Попов on 24.05.2021.
//

import Foundation
import PinLayout
import UIKit

class GetVocabularyNameViewController: UIViewController {
    
    private lazy var myVocabulariesHeadView = MyVocabulariesHeadView(frame: .zero, root: self, model: .init(name: "Новый словарь"))
    private let continueButton = UIButton()
    
    private let arrowIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-arrow-right")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let textField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите название"
        textField.font = .standartFont
        textField.textColor = .textColorLight
        textField.textAlignment = .center
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backGroundSettingColor
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myVocabulariesHeadView.pin
            .height(84)
            .top()
            .left()
            .right()
        
        textField.pin
            .below(of: myVocabulariesHeadView)
            .marginVertical(176)
            .left(80)
            .right(80)
            .height(29)
        
        arrowIcon.pin
            .size(48)
            .center()
        
        continueButton.pin
            .size(48)
            .below(of: textField)
            .marginVertical(140)
            .right(19)
        
    }
    private func setup(){
        [myVocabulariesHeadView, continueButton, textField].forEach{
            view.addSubview($0)
        }
        continueButton.addSubview(arrowIcon)

//        continueButton.addTarget(self, action: #selector(newSettingController), for: .touchUpInside)
    }
}

