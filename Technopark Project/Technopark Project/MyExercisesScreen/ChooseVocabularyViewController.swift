//
//  ChooseVocabularyViewController.swift
//  Technopark Project
//
//  Created by Михаил Попов on 26.05.2021.
//

import Foundation
import PinLayout
import UIKit

class ChooseVocabularyViewController: UIViewController {
    
    weak var delegate: PopDelegate?
    
    private lazy var myExercisesHeadView = HeaderView(frame: .zero, root: self, model: .init(name: "Выберете словарь",
                                                                                                backButtonIsHidden: false,
                                                                                                settingButtonIsHidden: true))
    
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
        
        myExercisesHeadView.delegate = self
        myVocabulariesCollectionView.delegate = self
        myVocabulariesCollectionView.dataSource = self
        myVocabulariesCollectionView.register(ChooseVocabularyCollectionViewCell.self,
                                              forCellWithReuseIdentifier: "ChooseVocabularyCollectionViewCell")
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myExercisesHeadView.pin
            .height(84)
            .top(view.pin.safeArea)
            .left()
            .right()
        
        searchVocabularyBar.pin
            .left(20)
            .right(20)
            .below(of: myExercisesHeadView)
            .marginVertical(32)
            .height(48)
        
        myVocabulariesCollectionView.pin
            .below(of: searchVocabularyBar)
            .marginVertical(23)
            .horizontally()
            .bottom(view.pin.safeArea + 10)
    }
    
    private func setup(){
        [myExercisesHeadView, searchVocabularyBar, myVocabulariesCollectionView].forEach{
            view.addSubview($0)
        }
    }
}

extension ChooseVocabularyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ChooseVocabularyDelegate, PopDelegate, HeaderDelegate {
    
    func didFinishVC(controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
    }
    
    func moveBack() {
        delegate?.didFinishVC(controller: self)
    }
    
    func openLessonViewController(position: Int) {
        let newViewController = LessonViewController()
        newViewController.configure(with: .init(vocabulary: myVocabularies[position]))//myVocabularies[position])
        newViewController.delegate = self
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    //Колличество ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myVocabularies.count
    }
    
    //Вызов нужной ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseVocabularyCollectionViewCell",
                                                            for: indexPath) as? ChooseVocabularyCollectionViewCell else { return .init() }
        
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
