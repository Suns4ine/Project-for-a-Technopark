//
//  GetVocabularyNameViewController.swift
//  Technopark Project
//
//  Created by Михаил Попов on 24.05.2021.
//

import Foundation
import PinLayout
import UIKit

class GetVocabularyNameViewController: UIViewController{
    
    weak var delegate: PopDelegate?
    
    private lazy var myVocabulariesHeadView = HeaderView(frame: .zero, root: self, model: .init(name: "Введите название",
                                                                                                backButtonIsHidden: false,
                                                                                                settingButtonIsHidden: true))
    
    private let continueButton = UIButton()
    
    private let arrowIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-arrow-right")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let textField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Новый словарь"
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
            .top(view.pin.safeArea)
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
        myVocabulariesHeadView.delegate = self
        
        continueButton.addSubview(arrowIcon)
        
        continueButton.isEnabled = false
        continueButton.isHidden = true
        
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
        continueButton.addTarget(self, action: #selector(addNewVocabulary), for: .touchUpInside)
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
    private func addNewVocabulary() {
        let newViewController = VocabularyViewController()
        let newVocabulary = Vocabulary.init(name: textField.text!, progress: 0, succses: false, words: [])
        myVocabularies.append(newVocabulary)
        newViewController.getVocabulary(vocabulary_: myVocabularies[myVocabularies.count - 1])
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

extension GetVocabularyNameViewController: HeaderDelegate {
    
    func moveBack() {
        delegate?.didFinishVC(controller: self)
    }
}

