//
//  DeleteVocabulariesViewController.swift
//  Technopark Project
//
//  Created by Михаил Попов on 10.06.2021.
//

import Foundation
import PinLayout
import UIKit

class DeleteVocabulariesViewController: UIViewController {
    
    weak var delegate: PopDelegate?
    
    private lazy var myVocabulariesHeadView = DeleteHeaderView(frame: .zero, root: self, model: .init(name: "Мои словари",
                                                                                                backButtonIsHidden: false,
                                                                                                settingButtonIsHidden: false))

    private let checkIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-list-check 1")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let deleteButtonLabel: UILabel = {
        let label = UILabel()
        label.font = .smallButtonFont
        label.textAlignment = .center
        label.textColor = .textColorLight
        label.sizeToFit()
        return label
    }()
    
    private let deleteButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .buttonColor
        button.layer.cornerRadius = 24
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 1
        return button
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
        deleteButtonLabel.text = "Удалить"
        
        myVocabulariesHeadView.delegate = self
        myVocabulariesCollectionView.delegate = self
        myVocabulariesCollectionView.dataSource = self
        myVocabulariesCollectionView.register(CollectionDeleteVocabulariesViewCell.self,
                                              forCellWithReuseIdentifier: "CollectionDeleteVocabulariesViewCell")
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myVocabulariesHeadView.pin
            .height(40)
            .top(view.pin.safeArea)
            .left()
            .right()
        
        checkIcon.pin
            .size(24)
            .below(of: myVocabulariesHeadView)
            .marginVertical(48)
            .left(34)
        
        deleteButton.pin
            .height(48)
            .width(155)
            .hCenter()
            .below(of: myVocabulariesHeadView)
            .marginVertical(32)
        
        deleteButtonLabel.pin
            .center()
            .sizeToFit()
        
        myVocabulariesCollectionView.pin
            .below(of: deleteButton)
            .marginVertical(23)
            .horizontally()
            .bottom(view.pin.safeArea + 10)
    }
    
    private func setup(){
        [myVocabulariesHeadView, deleteButton, checkIcon, myVocabulariesCollectionView].forEach{
            view.addSubview($0)
        }
        deleteButton.addSubview(deleteButtonLabel)
        
        deleteButton.addTarget(self, action: #selector(deleteVocabulary), for: .touchUpInside)
    }
     
    @objc
    private func deleteVocabulary() {
        
    }
}

extension DeleteVocabulariesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, HeaderDelegate {
    
    func moveBack() {
        delegate?.didFinishVC(controller: self)
    }
    
    //Колличество ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myVocabularies.count
    }
    
    //Вызов нужной ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionDeleteVocabulariesViewCell",
                                                            for: indexPath) as? CollectionDeleteVocabulariesViewCell else { return .init() }
        
        cell.configure(with: myVocabularies[indexPath.row], model: indexPath.row)
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
