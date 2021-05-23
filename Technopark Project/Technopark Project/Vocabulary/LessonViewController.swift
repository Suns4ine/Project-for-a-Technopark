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
        
        collectionView.pin
            .left()
            .right()
            .height(336)
            .top(119) //изменить в дальнейшем
        
        headerView.pin
            .top(view.pin.safeArea.top)
            .horizontally()
            .height(70)
        
    }
    
    private func setup() {
        [collectionView, questionIcon, headerView].forEach { self.view.addSubview($0) }
    }
}

