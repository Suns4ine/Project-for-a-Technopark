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
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let titleIcon = UIImageView()
    
    private var mainCollectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        return UICollectionView(frame: .init(), collectionViewLayout: collectionLayout)
    }()
    
    private var educationalMaterial = [EducationalMaterial]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        [titleLabel, titleIcon, mainCollectionView, subTitleLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
        
        titleLabel.font = UIFont(name: "Inter-SemiBold", size: 24)
        titleLabel.textColor = UIColor(hex: textColorLight)
        
        mainCollectionView.backgroundColor = .clear
        mainCollectionView.showsHorizontalScrollIndicator = false
        mainCollectionView.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        
        titleIcon.image = titleIcon.image?.tinted(with: UIColor(hex: iconColor))
        
        subTitleLabel.textColor = UIColor(hex: textColorLight)
        subTitleLabel.font = UIFont(name: subTitleLabel.font.fontName, size: 24)
        subTitleLabel.numberOfLines = 3
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = UIFont(name: "Inter-SemiBold", size: 24)
        
        titleLabel.pin
            .sizeToFit()
            .top(27)
            .left(19)

        titleIcon.pin
            .after(of: titleLabel)
            .margin(11)
            .size(24)
            .top(16)

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
        subTitleLabel.text = "У вас еще нет словарей. Создайте свой или возьмите готовый."
    }
}



extension MainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //Колличество ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return educationalMaterial.count
    }
    
    //Вызов нужной ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else {
            return .init()
        }
        
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
