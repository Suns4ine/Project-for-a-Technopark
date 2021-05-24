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
    
    private lazy var headerView = LessonHeaderView(frame: .zero, rootController: self)
    private var vocabulary: Vocabulary!
    
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
    
    private let lessonCollectionView: UICollectionView = {
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
        
        view.backgroundColor = .backGroundLessonColor
        
        lessonCollectionView.delegate = self
        lessonCollectionView.dataSource = self
        lessonCollectionView.register(LessonCollectionViewCell.self, forCellWithReuseIdentifier: "LessonCollectionViewCell")
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.pin
            .top(view.pin.safeArea.top)
            .horizontally()
            .height(70)
        
        lessonCollectionView.pin
            .left()
            .right()
            .height(170)//(self.view.frame.height * 0.2)
            .below(of: headerView)
            .marginVertical(5)
        
        counterLabel.pin
            .sizeToFit()
            .below(of: lessonCollectionView)
            .marginVertical(9)
            .right(17)
        
        translationLabel.pin
            .sizeToFit()
            .below(of: lessonCollectionView)
            .marginVertical(42)
            .left(32)
    }
    
    private func setup() {
        [lessonCollectionView, questionIcon, headerView, counterLabel, translationLabel].forEach { self.view.addSubview($0) }
    }
    
    func configure(with model: LessonViewModel) {
        self.vocabulary = model.vocabulary
    }
}


extension LessonViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10//return vocabulary.words.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LessonCollectionViewCell",
                                                            for: indexPath) as? LessonCollectionViewCell else { return .init() }
        
        //cell.configure(with: educationalMaterial[indexPath.row])
        return cell
    }
    
    //Размеры ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40, height: collectionView.frame.height - 10)//CGSize(width: 300, height: 160)
    }
    
//    //Расстояние между ячейками
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(8)
//    }
}
