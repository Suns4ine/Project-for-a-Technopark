//
//  LessonViewController.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 23.05.2021.
//

import Foundation
import UIKit
import PinLayout

class LessonViewController: UIViewController {
    
    private let headerView = LessonHeaderView()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.font = .standartFont
        label.textColor = .textColorLight
        label.text = "100/100"
        return label
    }()
    
    private let translationLabel: UILabel = {
        let label = UILabel()
        label.font = .standartFont
        label.textColor = .textColorLight
        label.text = "Лев"
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .init(), collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        return collectionView
    }()
    
    private let questionIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fi-rr-interrogation 1")
        imageView.image = imageView.image?.tinted(with: .iconColor)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backGroundMainColor
        //headerView.backgroundColor = .green
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.pin
            .top(view.pin.safeArea.top)
            .horizontally()
            .height(70)
        
        collectionView.pin
            .left()
            .right()
            .height(170)
            .below(of: headerView)
            .marginVertical(5)
        
        counterLabel.pin
            .sizeToFit()
            .below(of: collectionView)
            .marginVertical(9)
            .right(17)
        
        translationLabel.pin
            .sizeToFit()
            .below(of: collectionView)
            .marginVertical(42)
            .left(32)
    }
    
    private func setup() {
        [collectionView, questionIcon, headerView, counterLabel, translationLabel].forEach { self.view.addSubview($0) }
    }
}

