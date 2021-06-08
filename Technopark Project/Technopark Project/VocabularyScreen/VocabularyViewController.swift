//
//  VocabularyViewController.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 24.05.2021.
//

import Foundation
import PinLayout
import UIKit

class VocabularyViewController: UIViewController {
    
    var vocabulary: Vocabulary = myVocabularies[0]
    
    func getVocabulary (vocabulary_: Vocabulary) {
        vocabulary = vocabulary_
    }
    
    private lazy var vocabularyHeaderView = HeaderView(frame: .zero, root: self, model: .init(name: vocabulary.name,
                                                                                              backButtonIsHidden: true,
                                                                                              settingButtonIsHidden: false,
                                                                                              crossButtonIsHidden: false))
    
    private lazy var vocabularyEmptyView = VocabularyEmptyView(frame: .init(), root: self)
    
    private lazy var vocabularyFilledView = VocabularyFilledView(frame: .init(), root: self, model: vocabulary)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backGroundOtherColor
        vocabularyEmptyView.delegate = self
        vocabularyFilledView.delegate = self
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        vocabularyHeaderView.pin
            .height(84)
            .top()
            .left()
            .right()
        
        if vocabulary.words.isEmpty {
            vocabularyEmptyView.pin
                .below(of: vocabularyHeaderView)
                .horizontally()
                .bottom()
        } else {
            vocabularyFilledView.pin
                .below(of: vocabularyHeaderView)
                .horizontally()
                .bottom()
        }
    }
    
    private func setup() {
        [vocabularyHeaderView, vocabularyEmptyView, vocabularyFilledView].forEach { view.addSubview($0)}
        
        //vocabularyFilledView.backgroundColor = .otherColor
    }
}
extension VocabularyViewController: AddWordDelegate {
    
    func newWord() {
        let newViewController = GetWordNameViewController()
        newViewController.getVocabulary(vocabulary_: vocabulary)
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
