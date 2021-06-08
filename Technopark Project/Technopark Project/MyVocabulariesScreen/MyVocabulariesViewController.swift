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
    
    weak var delegate: PopDelegate?
    
    private let addButton = UIButton()
    
    private lazy var myVocabulariesHeadView = HeaderView(frame: .zero, root: self, model: .init(name: "Мои словари",
                                                                                                backButtonIsHidden: false,
                                                                                                settingButtonIsHidden: false,
                                                                                                crossButtonIsHidden: true))

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
        
        myVocabulariesHeadView.delegate = self
        myVocabulariesCollectionView.delegate = self
        myVocabulariesCollectionView.dataSource = self
        myVocabulariesCollectionView.register(MyVocabulariesCollectionViewCell.self,
                                              forCellWithReuseIdentifier: "MyVocabulariesCollectionViewCell")
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myVocabulariesHeadView.pin
            .height(40)
            .top(view.pin.safeArea)
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
        
        addButton.addTarget(self, action: #selector(newVocabulary), for: .touchUpInside)
    }
     
    @objc
    private func newVocabulary() {
        let newViewController = GetVocabularyNameViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

extension MyVocabulariesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, VocabularyDelegate, HeaderDelegate {
    
    func moveBack() {
        self.navigationController?.popViewController(animated: true)
        delegate?.didFinishVC(controller: self)
    }
    
    func openVocabularyViewController(position: Int) {
        let newViewController = VocabularyViewController()
        newViewController.getVocabulary(vocabulary_: myVocabularies[position])
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    //Колличество ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myVocabularies.count
    }
    
    //Вызов нужной ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyVocabulariesCollectionViewCell",
                                                            for: indexPath) as? MyVocabulariesCollectionViewCell else { return .init() }
        
        cell.configure(with: myVocabularies[indexPath.row], model: indexPath.row)
        cell.delegate = self
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
