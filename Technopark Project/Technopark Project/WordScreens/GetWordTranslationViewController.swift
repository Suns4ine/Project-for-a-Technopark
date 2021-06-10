//
//  GetWordTranslationViewController.swift
//  Technopark Project
//
//  Created by Михаил Попов on 04.06.2021.
//

import Foundation
import PinLayout
import UIKit

class GetWordTranslationViewController: UIViewController {
    
    var vocabulary: Vocabulary = myVocabularies[0]
    
    func getVocabulary (vocabulary_: Vocabulary) {
        vocabulary = vocabulary_
    }
    
    private lazy var headerWordView = HeaderView (frame: .zero, root: self, model: .init(name: "Введите перевод",
                                                                                         backButtonIsHidden: true,
                                                                                         settingButtonIsHidden: true,
                                                                                         crossButtonIsHidden: false))
    
    private let continueButton = UIButton()
    
    private let arrowIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-arrow-right")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let textField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Перевод"
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
        
        headerWordView.pin
            .height(84)
            .top()
            .left()
            .right()
        
        textField.pin
            .below(of: headerWordView)
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
        [headerWordView, continueButton, textField].forEach{
            view.addSubview($0)
        }
        continueButton.addSubview(arrowIcon)
        continueButton.isEnabled = false
        continueButton.isHidden = true
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
        continueButton.addTarget(self, action: #selector(addNewWord), for: .touchUpInside)
    }
    
    @objc
    private func editingChanged(){
        if textField.text?.trim() == ""{
            textField.text = textField.text?.trim()
            return
        }
        guard
            let field = textField.text, !field.isEmpty
        else {
            continueButton.isEnabled = false
            return
        }
        continueButton.isEnabled = true
        continueButton.isHidden = false
    }
    
    @objc
    private func addNewWord() {
        let newViewController = VocabularyViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
        myVocabularies.append(.init(name: textField.text!, progress: 0, succses: false, words: []))
    }
}
