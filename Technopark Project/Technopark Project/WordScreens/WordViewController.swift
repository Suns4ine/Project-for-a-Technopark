//
//  WordViewController.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 28.05.2021.
//

import Foundation
import PinLayout
import UIKit

class WordViewController: UIViewController, UIScrollViewDelegate {
    
    private let arrayButton = ["Редактировать", "Удалить"]
    private var word: Word!
    private var vocabulary = Vocabulary(name: "Погода", progress: 12, succses: false, words: [Word(name: "Animal", translation: "Животное"), Word(name: "Build", translation: "Строить")])//vocabulary: Vocabulary!// Vocabulary!
    
    private lazy var headerWordView = HeaderWordView(frame: .zero, root: self, model: vocabulary)
    
    private let wordLabel: UILabel = {
        let label = UILabel()
        label.font = .bigFont
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .viewColor
        return view
    }()
    
    private let titleTranslationLabel: UILabel = {
        let label = UILabel()
        label.font = .standartFont
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let translationWordLabel: UILabel = {
        let label = UILabel()
        label.font = .standartFont
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private var wordTabelView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.alwaysBounceVertical = false
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        return table
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        word = .init(name: "Rain", translation: "Дождь")
        
        wordTabelView.delegate = self
        wordTabelView.dataSource = self
        wordTabelView.register(WordTabelViewCell.self, forCellReuseIdentifier: "WordTabelViewCell")
        view.backgroundColor = .backGroundOtherColor
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerWordView.pin
            .top()
            .horizontally()
            .height(84)
        
        wordLabel.pin
            .below(of: headerWordView)
            .marginVertical(73)
            .hCenter()
            .sizeToFit()
            
        underlineView.pin
            .below(of: wordLabel)
            .marginVertical(10)
            .hCenter()
            .width(wordLabel.frame.width + 10)
            .height(1)
        
        titleTranslationLabel.pin
            .sizeToFit()
            .below(of: underlineView)
            .marginVertical(13)
            .left(21)
        
        translationWordLabel.pin
            .sizeToFit()
            .below(of: titleTranslationLabel)
            .marginVertical(23)
            .left(48)
            
        wordTabelView.pin
            .below(of: translationWordLabel)
            .marginVertical(25)
            .horizontally(110)
            .bottom(40)

    }
    
    func configure(word: Word) {
        self.word = word
    }
    
    private func setup() {
        [headerWordView, wordLabel, underlineView, titleTranslationLabel,
         translationWordLabel, wordTabelView].forEach { view.addSubview($0) }
        
        titleTranslationLabel.text = "Перевод:"
        wordLabel.text = word.name
        translationWordLabel.text = word.translation
    }
}


extension WordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "WordTabelViewCell",
                for: indexPath) as? WordTabelViewCell else { return .init() }
        
        cell.configure(with: arrayButton[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}
