//
//  GetWordNameViewController.swift
//  Technopark Project
//
//  Created by Михаил Попов on 04.06.2021.
//

import Foundation
import PinLayout
import UIKit

class GetWordNameViewController: UIViewController {
    
    weak var delegate: PopDelegate?
    
    var vocabulary: Vocabulary = myVocabularies[0]
    
    func getVocabulary (vocabulary_: Vocabulary) {
        vocabulary = vocabulary_
    }
    
    private lazy var headerWordView = HeaderView (frame: .zero, root: self, model: .init(name: "Введите слово",
                                                                                         backButtonIsHidden: false,
                                                                                         settingButtonIsHidden: true))
    
    private let continueButton = UIButton()
    
    private let arrowIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-arrow-right")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let nameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Слово по английски"
        textField.font = .standartFont
        textField.textColor = .textColorLight
        textField.textAlignment = .center
        return textField
    }()
    
    private let translationTextField:UITextField = {
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
        headerWordView.delegate = self
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerWordView.pin
            .height(84)
            .top(view.pin.safeArea)
            .left()
            .right()
        
        nameTextField.pin
            .below(of: headerWordView)
            .marginVertical(100)
            .left(80)
            .right(80)
            .height(29)
        
        translationTextField.pin
            .below(of: nameTextField)
            .marginVertical(100)
            .left(80)
            .right(80)
            .height(29)
        
        arrowIcon.pin
            .size(48)
            .center()
        
        continueButton.pin
            .size(48)
            .below(of: translationTextField)
            .marginVertical(100)
            .right(19)
        
    }
    private func setup(){
        [headerWordView, continueButton, nameTextField, translationTextField].forEach{
            view.addSubview($0)
        }
        continueButton.addSubview(arrowIcon)
        continueButton.isEnabled = false
        continueButton.isHidden = true
        
        nameTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        translationTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
        continueButton.addTarget(self, action: #selector(addNewWord), for: .touchUpInside)
    }
    
    @objc
    private func editingChanged(){
        if nameTextField.text?.trim() == ""{
            nameTextField.text = nameTextField.text?.trim()
            return
        }
        if translationTextField.text?.trim() == ""{
            translationTextField.text = translationTextField.text?.trim()
            return
        }
        guard
            let name = nameTextField.text, !name.isEmpty,
            let translation = translationTextField.text, !translation.isEmpty
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

        let position = myVocabularies.firstIndex(where: {$0.name == vocabulary.name})!
        myVocabularies[position].words.append(.init(name: nameTextField.text!,
                                      translation: translationTextField.text!))
        newViewController.getVocabulary(vocabulary_: myVocabularies[position])
        newViewController.delegate = self
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

extension GetWordNameViewController: HeaderDelegate, PopDelegate {
    
    func didFinishVC(controller: UIViewController) {
        controller.navigationController?.popViewController(animated: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    func moveBack() {
        delegate?.didFinishVC(controller: self)
    }
}
