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
    
    weak var delegate: PopDelegate?
    var vocabulary: Vocabulary!
    var word: Word!
    
    func getVocabulary (vocabulary_: Vocabulary) {
        vocabulary = vocabulary_
    }
    
    private lazy var headerView = HeaderView(frame: .zero, root: self, model: .init(name: vocabulary.name,
                                                                                   backButtonIsHidden: false,
                                                                                   settingButtonIsHidden: true))
    
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
        
        view.backgroundColor = .backGroundOtherColor
        
        headerView.delegate = self
        wordTabelView.delegate = self
        wordTabelView.dataSource = self
        wordTabelView.register(WordTabelViewCell.self, forCellReuseIdentifier: "WordTabelViewCell")
        
        setup()
    }
    
    func configure(wordNumber: Int) {
        self.word = vocabulary.words[wordNumber]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.pin
            .top(view.pin.safeArea)
            .horizontally()
            .height(84)
        
        wordLabel.pin
            .below(of: headerView)
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
    
    private func setup() {
        [headerView, wordLabel, underlineView, titleTranslationLabel,
         translationWordLabel, wordTabelView].forEach { view.addSubview($0) }
        
        titleTranslationLabel.text = "Перевод:"
        wordLabel.text = word.name
        translationWordLabel.text = word.translation
    }
}


extension WordViewController: UITableViewDelegate, UITableViewDataSource, HeaderDelegate {
    
    func moveBack() {
        delegate?.didFinishVC(controller: self)
    }
    
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
