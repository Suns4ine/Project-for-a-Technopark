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
    
    private lazy var vocabulary = Vocabulary(name: "Погода", progress: 12, succses: false, words: [Word(name: "A", translation: "b"), Word(name: "v", translation: "v")], learnedWords: [], misspelledWords: [], dateCreate: Date(), dateOfChange: Date(), numberOfAttempts: 0)//vocabulary: Vocabulary!
    
    private lazy var vocabularyHeaderView = VocabularyHeaderView(frame: .init(), root: self, model: .init(name: "Погода", vocabulary: vocabulary))
    private lazy var vocabularyEmptyView = VocabularyEmptyView(frame: .init(), root: self, model: .init(name: "", vocabulary: .init(name: "", progress: 0, succses: false, words: [], learnedWords: [], misspelledWords: [], dateCreate: Date(), dateOfChange: Date(), numberOfAttempts: 0)))
    
    private lazy var vocabularyFilledView = VocabularyFilledView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backGroundOtherColor
        
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
