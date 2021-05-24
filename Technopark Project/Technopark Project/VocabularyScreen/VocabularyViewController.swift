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
    
    private lazy var vocabularyHeaderView = VocabularyHeaderView(frame: .init(), root: self, model: .init(name: "Погода"))
    private lazy var vocabularyEmptyView = VocabularyEmptyView(frame: .init(), root: self, model: .init(name: ""))
    
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
        
        vocabularyEmptyView.pin
            .below(of: vocabularyHeaderView)
            .horizontally()
            .bottom()
    }
    
    private func setup() {
        [vocabularyHeaderView, vocabularyEmptyView].forEach { view.addSubview($0)}
        
        //vocabularyEmptyView.backgroundColor = .otherColor
    }
}
