//
//  LessonCollectionViewCell.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 24.05.2021.
//

import Foundation
import UIKit
import PinLayout


final class LessonCollectionViewCell: UICollectionViewCell, HorizontalEdge {
    
    private var word: Word!
    private var rootController: UIViewController!
    private var widthWord: Int!
    
    private let volumeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fi-rr-volume")
        imageView.image = imageView.image?.tinted(with: .iconColor)
        return imageView
    }()
    
    private let textField: UITextField = {
       let textField = UITextField()
        textField.font = .standartFont
        textField.placeholder = "Enter text here"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.delegate = self as? UITextFieldDelegate
        textField.backgroundColor = .lessonTextFieldColor
        return textField
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

//        volumeIcon.pin
//            .size(24)
//            .top(12)
//            .right(16)

        textField.pin
            .horizontally(12)
            .height(52)
            .top((self.bounds.height / 2) - 26)
            //.sizeToFit()
            //.size(20)
    }

    func configure(with model: Word, root: UIViewController) {
        word = model
        rootController = root
        widthWord = 8 + Int(Double(model.name.count) * 15.25) >= Int(self.bounds.width - 24) ? Int(self.bounds.width - 24) :  8 + Int(Double(model.name.count) * 15.25)
    }

    private func setup() {
        
        [volumeIcon, textField].forEach { addSubview($0)}
        
        backgroundColor = .viewColor
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
    }
}


extension LessonCollectionViewCell: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        // may be useful: textField.resignFirstResponder()
        return true
    }

}
