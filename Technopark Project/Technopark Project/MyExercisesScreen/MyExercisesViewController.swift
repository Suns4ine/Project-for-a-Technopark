//
//  MyExercisesViewController.swift
//  Technopark Project
//
//  Created by Михаил Попов on 24.05.2021.
//

import Foundation
import PinLayout
import UIKit

class MyExercisesViewController: UIViewController {
    
    weak var delegate: PopDelegate?
    
    private lazy var myExercisesHeadView = HeaderView(frame: .zero, root: self, model: .init(name: "Упражнения",
                                                                                                backButtonIsHidden: false,
                                                                                                settingButtonIsHidden: true))
    
    private lazy var myExercisesCollectionView: UICollectionView = {
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
        myExercisesCollectionView.delegate = self
        myExercisesCollectionView.dataSource = self
        myExercisesCollectionView.register(MyExercisesCollectionViewCell.self,
                                              forCellWithReuseIdentifier: "MyExercisesCollectionViewCell")
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myExercisesHeadView.pin
            .height(84)
            .top(view.pin.safeArea)
            .left()
            .right()
        
        myExercisesCollectionView.pin
            .below(of: myExercisesHeadView)
            .marginVertical(23)
            .horizontally()
            .bottom(view.pin.safeArea + 10)
    }
    
    private func setup(){
        [myExercisesHeadView, myExercisesCollectionView].forEach{
            view.addSubview($0)
        }
    }
}

extension MyExercisesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MyExercisesCellDelegate, PopDelegate, HeaderDelegate {
    
    func didFinishVC(controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
    }
    
    func moveBack() {
        delegate?.didFinishVC(controller: self)
    }
    
    func openNewController() {
        let newViewController = ChooseVocabularyViewController()
        newViewController.delegate = self
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    //Колличество ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercises.count
    }
    
    //Вызов нужной ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyExercisesCollectionViewCell",
                                                            for: indexPath) as? MyExercisesCollectionViewCell else { return .init() }
        
        cell.configure(with: exercises[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    //Размеры ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let avalableWidth = myExercisesCollectionView.bounds.width - 55
        let sideLength = avalableWidth / 2
        return CGSize(width: sideLength, height: sideLength)
    }
    
    //Расстояние между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(15)
    }
    
}

