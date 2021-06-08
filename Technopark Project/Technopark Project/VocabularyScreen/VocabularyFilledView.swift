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
    
    weak var delegate: AddWordDelegate?
    
    private var words:[Word] = []
    
    private let addButton = UIButton()
    
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
    
    init(frame: CGRect, root: UIViewController, model: Vocabulary) {
        super.init(frame: frame)
        
        words = model.words
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addIcon.pin
            .size(24)
            .center()
        
        addButton.pin
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
        [searhWordBar, addButton, tableWordView].forEach { addSubview($0)}
        addButton.addSubview(addIcon)
        
        tableWordView.delegate = self
        tableWordView.dataSource = self
        tableWordView.register(TableWordViewCell.self, forCellReuseIdentifier: "TableWordViewCell")

        addButton.addTarget(self, action: #selector(newWord), for: .touchUpInside)
    }
    
    @objc
    private func newWord() {
        delegate?.newWord()
    }
}


extension VocabularyFilledView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "TableWordViewCell",
                for: indexPath) as? TableWordViewCell else { return .init() }
        cell.configure(with: words[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 38
    }
}
