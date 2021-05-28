//
//  VocabularyFilledView.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 25.05.2021.
//

import Foundation
import PinLayout
import UIKit

final class VocabularyFilledView: UIView {
    
    
    private let searhWordBar = UISearchBar()
    
    private let addIcon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-plus")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let tableWordView : UITableView = {
        let table = UITableView()
        //table.alwaysBounceVertical = false
        table.backgroundColor = .clear
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addIcon.pin
            .size(24)
            .right(35)
            .top(48)
            
        searhWordBar.pin
            .top(33)
            .left(21)
            .before(of: addIcon)
            .marginHorizontal(16)
            .height(48)
        
        tableWordView.pin
            .below(of: searhWordBar)
            .marginVertical(18)
            .horizontally(20)
            .bottom(40)
    }
    
    private func setup() {
        [searhWordBar, addIcon, tableWordView].forEach { addSubview($0)}
        
        tableWordView.delegate = self
        tableWordView.dataSource = self
        tableWordView.register(TableWordViewCell.self, forCellReuseIdentifier: "TableWordViewCell")

    }
}


extension VocabularyFilledView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "TableWordViewCell",
                for: indexPath) as? TableWordViewCell else { return .init() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 38
    }
}
