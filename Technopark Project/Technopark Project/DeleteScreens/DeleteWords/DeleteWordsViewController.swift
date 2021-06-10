//
//  DeleteWordsViewController.swift
//  Technopark Project
//
//  Created by Михаил Попов on 10.06.2021.
//

import Foundation
import PinLayout
import UIKit

class DeleteWordsViewController: UIViewController {
    
    weak var delegate: PopDelegate?
    
    var vocabulary: Vocabulary!
    private var words:[Word]!
    
    private let container = UIView()
    
    func getVocabulary (vocabulary_: Vocabulary) {
        vocabulary = vocabulary_
    }
    
    private lazy var vocabularyHeaderView = DeleteHeaderView (frame: .zero, root: self, model: .init(name: vocabulary.name,
                                                                                              backButtonIsHidden: true,
                                                                                              settingButtonIsHidden: true))
    
    private let checkIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-list-check 1")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    //Кнопка переместить
    private let changeVocabularyButtonLabel: UILabel = {
        let label = UILabel()
        label.font = .smallButtonFont
        label.textAlignment = .center
        label.textColor = .textColorLight
        label.sizeToFit()
        return label
    }()
    
    private let changeVocabularyButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .buttonColor
        button.layer.cornerRadius = 24
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 1
        return button
    }()
    
    //Кнопка удалить
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
    
    private let tableWordView : UITableView = {
        let table = UITableView()
        //table.alwaysBounceVertical = false
        table.backgroundColor = .clear
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backGroundOtherColor
        changeVocabularyButtonLabel.text = "Переместить"
        deleteButtonLabel.text = "Удалить"
        words = vocabulary.words
        
        vocabularyHeaderView.delegate = self
        tableWordView.delegate = self
        tableWordView.dataSource = self
        tableWordView.register(TableDeleteWordViewCell.self, forCellReuseIdentifier: "TableDeleteWordViewCell")
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        vocabularyHeaderView.pin
            .height(84)
            .top(view.pin.safeArea)
            .left()
            .right()
        
        container.pin
            .height(48)
            .below(of: vocabularyHeaderView)
            .marginVertical(32)
            .left()
            .right()
        
        checkIcon.pin
            .size(24)
            .left(34)
            .vCenter()
        
        changeVocabularyButton.pin
            .height(48)
            .width(140)
            .top()
            .after(of: checkIcon)
            .marginHorizontal(20)
        
        deleteButton.pin
            .height(48)
            .width(100)
            .top()
            .after(of: changeVocabularyButton)
            .marginHorizontal(20)
        
        changeVocabularyButtonLabel.pin
            .center()
            .sizeToFit()
        
        deleteButtonLabel.pin
            .center()
            .sizeToFit()
        
        tableWordView.pin
            .below(of: container)
            .marginVertical(18)
            .horizontally(20)
            .bottom(40)
    }
    
    private func setup() {
        [vocabularyHeaderView, container, tableWordView].forEach { view.addSubview($0)}
        changeVocabularyButton.addSubview(changeVocabularyButtonLabel)
        deleteButton.addSubview(deleteButtonLabel)
        [checkIcon, deleteButton, changeVocabularyButton].forEach{ container.addSubview($0)}
        
        changeVocabularyButton.addTarget(self, action: #selector(changeVocabulary), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteWord), for: .touchUpInside)
    }
    
    @objc
    private func changeVocabulary() {
        
    }
    
    @objc
    private func deleteWord() {
        
    }
}
extension DeleteWordsViewController: UITableViewDelegate, UITableViewDataSource, HeaderDelegate {
    
    func moveBack() {
        delegate?.didFinishVC(controller: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "TableDeleteWordViewCell",
                for: indexPath) as? TableDeleteWordViewCell else { return .init() }
        cell.configure(with: words[indexPath.row], model: indexPath.row)
//        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 38
    }
}
