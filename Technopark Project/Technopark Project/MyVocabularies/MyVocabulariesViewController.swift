//
//  MyVocabulariesViewController.swift
//  Technopark Project
//
//  Created by Михаил Попов on 23.05.2021.
//

import Foundation
import PinLayout
import UIKit

class MyVocabulariesViewController: UIViewController {
    
    private let myVocabulariesHeadView = MyVocabulariesHeadView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backGroundOtherColor
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myVocabulariesHeadView.pin
            .height(84)
            .top()
            .left()
            .right()
    }
    private func setup(){
        [myVocabulariesHeadView].forEach{
            view.addSubview($0)
        }
    }
}
