//
//  MainTableViewCell.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 20.05.2021.
//

import Foundation
import UIKit
import PinLayout

final class MainTableViewCell: UITableViewCell {
    
    private var educationalMaterial = [EducationalMaterial]()
    weak var delegate: ButtonDelegate?
    private let nextScreenButton = UIButton()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .standartFont
        label.textColor = .textColorLight
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColorLight
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = .standartFont
        return label
    }()
    
    private let titleIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let mainCollectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .init(), collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleIcon.image = titleIcon.image?.tinted(with: .iconColor) // почему-то раньше оно не перекрашиваетя
        
        titleLabel.pin
            .sizeToFit()
            .top()
            .left()

        titleIcon.pin
            .after(of: titleLabel)
            .marginHorizontal(11)
            .size(24)
            .top()
        
        nextScreenButton.pin
            .height(29)
            .width(192)
            .top(27)
            .left(19)

        if educationalMaterial.isEmpty {
            subTitleLabel.pin
                .top(10)
                .left(25)
                .right(25)
                .bottom(10)
        } else {
            mainCollectionView.pin
                .left()
                .right()
                .below(of: titleLabel)
                .marginVertical(30)
                .bottom()
        }
    }
    
    func configure(with model: EducationalMaterialModel) {
        titleLabel.text = model.title
        titleIcon.image = model.image
        educationalMaterial = model.material
        if (model.title == "Мои словари"){
            nextScreenButton.addTarget(self, action: #selector(newVocabularyController), for: .touchUpInside)
        } else {
            nextScreenButton.addTarget(self, action: #selector(newExercisesController), for: .touchUpInside)
        }
    }
    
    @objc
    private func newVocabularyController() {
        delegate?.newVocabularyController()
    }
    
    @objc
    private func newExercisesController() {
        delegate?.newExercisesController()
    }
    
    private func setup() {
        [nextScreenButton, mainCollectionView, subTitleLabel].forEach { contentView.addSubview($0) }
        [titleLabel, titleIcon].forEach { nextScreenButton.addSubview($0) }
        
        selectionStyle = .none
        backgroundColor = .clear
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
        
        subTitleLabel.text = "У вас еще нет словарей. Создайте свой или возьмите готовый."
    }
}

extension MainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //Колличество ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return educationalMaterial.count
    }
    
    //Вызов нужной ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell",
                                                            for: indexPath) as? MainCollectionViewCell else { return .init() }
        
        cell.configure(with: educationalMaterial[indexPath.row])
        return cell
    }
    
    //Размеры ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 160)
    }
    
    //Расстояние между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10.5)
    }
    
}

protocol  ButtonDelegate: AnyObject {
    func newVocabularyController()
    func newExercisesController()
}
