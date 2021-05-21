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
    
    private var titleLabel = UILabel()
    
    private let titleIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = imageView.image?.tinted(with: UIColor(hex: iconColor))
        return imageView
    }()
    
    //private let mainCollectionView = UICollectionView()
    private var vocabularies = [Vocabulary]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        [titleLabel, titleIcon].forEach {
            contentView.addSubview($0)
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //titleLabel.frame.size = CGSize(width: 240, height: 240)
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 24)
        titleLabel.textColor = UIColor(hex: 0xE0E9F2)
        //titleLabel.backgroundColor = .green
        
        titleIcon.image = titleIcon.image?.tinted(with: UIColor(hex: iconColor))
        
        titleLabel.pin
            .sizeToFit()
            .top(27)
            .left(19)
        
        titleIcon.pin
            .after(of: titleLabel)
            .margin(11)
            .size(24)
            .top(16)
        
//        mainCollectionView.pin
//            .left()
//            .right()
//            .below(of: titleLabel)
//            .marginVertical(30)
//            .bottom()
    }
    
    func configure(with model: VocabularyCell) {
        titleLabel.text = model.title
        titleIcon.image = model.image
        vocabularies = model.vocabularies
    }
}

//extension MainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return vocabularies.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let textLabel = UILabel()
//        //textLabel.text = vocabularies[indexPath.row].name
// //       textLabel.font = UIFont(name: vocabularies[indexPath.row].name, size: 24)
//        
//        let cell = UICollectionViewCell()
////        cell.frame.size = CGSize(width: 160, height: 160)
////        cell.backgroundColor = UIColor(hex: buttonColor)
////        cell.layer.cornerRadius = 8
////        cell.addSubview(textLabel)
//        return cell
//    }
//    
//}
