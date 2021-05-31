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
    
    private var word: Word!
    private var vocabulary = Vocabulary(name: "Погода", progress: 12, succses: false, words: [Word(name: "Animal", translation: "Животное"), Word(name: "Build", translation: "Строить")], learnedWords: [], misspelledWords: [], dateCreate: Date(), dateOfChange: Date(), numberOfAttempts: 0)//vocabulary: Vocabulary!// Vocabulary!
    
    private lazy var headerWordView = HeaderWordView(frame: .zero, root: self, model: .init(name: "Погода", vocabulary: vocabulary))
    
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel1: UILabel = {
        let label = UILabel()
        label.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let icnImage = UIImageView()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backGroundOtherColor
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerWordView.pin
            .top()
            .horizontally()
            .height(84)
        
        scrollView.pin
            //.height(800)
            .below(of: headerWordView)
            .horizontally()
            .bottom(20)
        
        contentView.pin
            .all()
        
        subtitleLabel.pin
            .height(500)
            .top()
            .horizontally()
        
        subtitleLabel1.pin
            .below(of: subtitleLabel)
            .marginVertical(20)
            .horizontally()
            .height(500)
    }
    
    func configure(word: Word) {
        self.word = word
    }
    
    private func setup() {
        [headerWordView, scrollView].forEach { view.addSubview($0) }
        scrollView.backgroundColor = .otherColor
        icnImage.image = UIImage(named: "fi-rr-arrow-left 1")
        scrollView.addSubview(contentView)
        contentView.backgroundColor = .green
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(subtitleLabel1)
//        scrollView.frame = self.view.bounds
        scrollView.delegate = self
        //scrollView.frame = self.view.frame
        //scrollView.contentSize = CGSize(width: view.bounds.width, height: 800)
//        self.scrollView.decelerationRate = .fast
//        self.scrollView.showsHorizontalScrollIndicator = false
    }
}
