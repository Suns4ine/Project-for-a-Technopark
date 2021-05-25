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
    
    private let addButton = UIButton()
    
    private var vocabularies: [Vocabulary] = [.init(name: "Лес", progress: 56, succses: false, words: [], learnedWords: [], misspelledWords: [], dateCreate: Date(), dateOfChange: Date(), numberOfAttempts: 1),
                                              .init(name: "Море", progress: 100, succses: true, words: [], learnedWords: [], misspelledWords: [], dateCreate: Date(), dateOfChange: Date(), numberOfAttempts: 1),
                                              .init(name: "Лес", progress: 56, succses: false, words: [], learnedWords: [], misspelledWords: [], dateCreate: Date(), dateOfChange: Date(), numberOfAttempts: 1),
                                              .init(name: "Лес", progress: 56, succses: false, words: [], learnedWords: [], misspelledWords: [], dateCreate: Date(), dateOfChange: Date(), numberOfAttempts: 1),
                                              .init(name: "Море", progress: 100, succses: true, words: [], learnedWords: [], misspelledWords: [], dateCreate: Date(), dateOfChange: Date(), numberOfAttempts: 1),
                                              .init(name: "Лес", progress: 56, succses: false, words: [], learnedWords: [], misspelledWords: [], dateCreate: Date(), dateOfChange: Date(), numberOfAttempts: 1),
                                              .init(name: "Лес", progress: 56, succses: false, words: [], learnedWords: [], misspelledWords: [], dateCreate: Date(), dateOfChange: Date(), numberOfAttempts: 1),]
    
    private lazy var myVocabulariesHeadView = MyVocabulariesHeadView(frame: .zero, root: self, model: .init(name: "Мои словари"))
    
    private let addIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-plus")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let searchVocabularyBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    private lazy var myVocabulariesCollectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .init(), collectionViewLayout: collectionLayout)
        collectionView.alwaysBounceVertical = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0,
                                                   left: 20,
                                                   bottom: 0,
                                                   right: 20)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backGroundOtherColor
        
        myVocabulariesCollectionView.delegate = self
        myVocabulariesCollectionView.dataSource = self
        myVocabulariesCollectionView.register(MyVocabulariesCollectionViewCell.self,
                                              forCellWithReuseIdentifier: "MyVocabulariesCollectionViewCell")
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myVocabulariesHeadView.pin
            .height(84)
            .top()
            .left()
            .right()
        
        addButton.pin
            .size(24)
            .right(35)
            .below(of: myVocabulariesHeadView)
            .marginVertical(44)
        
        addIcon.pin
            .size(24)
            .center()
        
        searchVocabularyBar.pin
            .left(21)
            .before(of: addIcon)
            .marginHorizontal(16)
            .below(of: myVocabulariesHeadView)
            .marginVertical(32)
            .height(48)
        
        myVocabulariesCollectionView.pin
            .below(of: searchVocabularyBar)
            .marginVertical(23)
            .horizontally()
            .bottom(view.pin.safeArea + 10)
    }
    
    private func setup(){
        [myVocabulariesHeadView, addButton, searchVocabularyBar, myVocabulariesCollectionView].forEach{
            view.addSubview($0)
        }
        addButton.addSubview(addIcon)
        
        addButton.addTarget(self, action: #selector(newController), for: .touchUpInside)
    }
     
    @objc
    private func newController() {
        let newViewController = GetVocabularyNameViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

extension MyVocabulariesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //Колличество ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vocabularies.count
    }
    
    //Вызов нужной ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyVocabulariesCollectionViewCell",
                                                            for: indexPath) as? MyVocabulariesCollectionViewCell else { return .init() }
        
        cell.configure(with: vocabularies[indexPath.row])
        return cell
    }
    
    //Размеры ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let avalableWidth = myVocabulariesCollectionView.bounds.width - 55
        let sideLength = avalableWidth / 2
        return CGSize(width: sideLength, height: sideLength)
    }
    
    //Расстояние между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(15)
    }
    
}
