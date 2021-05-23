//
//  SettingTableViewCell.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 22.05.2021.
//

import Foundation
import  UIKit
import PinLayout

final class SettingTableViewCell: UITableViewCell {
    
    private var root: SettingViewController!
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    private let backgroundTableViewCell: UIView = {
        let view = UIView()
        view.backgroundColor = .buttonColor
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.shadowColor.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 0.25
        view.layer.shadowRadius = 1
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .standartFont
        label.textColor = .textColorLight
        label.textAlignment = .center
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: SettingViewController, nameCell: String) {
        titleLabel.text = nameCell
        root = model
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundTableViewCell.pin
            .top(5)
            .bottom(5)
            .left()
            .right()
        
        titleLabel.pin
            .top(5)
            .bottom(5)
            .left(15)
            .right(15)
        
//        button.pin
//            .all()
        
        //closeController()
    }
    
    
    private func setup() {
        [backgroundTableViewCell].forEach { addSubview($0) }
        [titleLabel, button].forEach {  backgroundTableViewCell.addSubview($0)}
        
        button.addTarget(self, action: #selector(closeController), for: .touchUpInside)
        
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    @objc
    private func closeController() {
        
        let transition = CATransition()
        transition.duration = 2.7
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        self.window!.layer.add(transition, forKey: kCATransition)
        
        //root.dismiss(animated: true, completion: nil)
        //root.navigationController?.popViewController(animated: true)
        //root.navigationController?.dismiss(animated: true, completion: nil)
    }
}
