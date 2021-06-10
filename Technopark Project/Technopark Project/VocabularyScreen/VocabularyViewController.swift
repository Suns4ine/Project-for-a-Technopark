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
    
    var vocabulary: Vocabulary!
    weak var delegate: PopDelegate?
    
    func getVocabulary (vocabulary_: Vocabulary) {
        vocabulary = vocabulary_
    }
    
    private lazy var vocabularyHeaderView = HeaderView(frame: .zero, root: self, model: .init(name: vocabulary.name,
                                                                                              backButtonIsHidden: false,
                                                                                              settingButtonIsHidden: vocabulary.words.isEmpty))
    
    private lazy var vocabularyEmptyView = VocabularyEmptyView(frame: .init(), root: self)
    
    private lazy var vocabularyFilledView = VocabularyFilledView(frame: .init(), root: self, model: vocabulary)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGroundOtherColor
        
        vocabularyHeaderView.delegate = self
        vocabularyEmptyView.delegate = self
        vocabularyFilledView.delegate = self
        vocabularyFilledView.secondDelegate = self
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        vocabularyHeaderView.pin
            .height(84)
            .top(view.pin.safeArea)
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
    }
}
extension VocabularyViewController: AddWordDelegate, WordOpenDelegate, HeaderDelegate, PopDelegate {
    
    func didFinishVC(controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
    }
    
    func moveBack() {
        let newViewController = MainViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func deleteObjects() {
        let newViewController = DeleteWordsViewController()
        newViewController.delegate = self
        newViewController.getVocabulary(vocabulary_: vocabulary)
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func openWordViewController(position: Int) {
        let newViewController = WordViewController()
        newViewController.getVocabulary(vocabulary_: vocabulary)
        newViewController.configure(wordNumber: position)
        newViewController.delegate = self
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func newWord() {
        let newViewController = GetWordNameViewController()
        newViewController.getVocabulary(vocabulary_: vocabulary)
        newViewController.delegate = self
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
