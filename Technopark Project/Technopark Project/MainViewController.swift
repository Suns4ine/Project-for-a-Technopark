//
//  ViewController.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 07.04.2021.
//

import UIKit
import PinLayout

struct VocabularyCell {
    var image: UIImage?
    var title: String
    var vocabularies: [Vocabulary]
}

class MainViewController: UIViewController {
    
    var vocabularies: [Vocabulary] = [.init(name: "Растения") , .init(name: "Глаголы"), .init(name: "Учеба"), .init(name: "Школа")]
    
    private var tableView = UITableView()
    private var headerView = UIView()
    private var reminder = UIImageView(image: UIImage(named: "fi-rr-bell 1"))
    private var accountImage = UIImageView(image: UIImage(named: "fi-rr-user 1"))
    
    private var buttonHeader: UIButton = {
        let button = UIButton()
        button.backgroundColor = .none
        button.titleLabel?.textColor = UIColor(hex: textColor)
        button.setTitle("QEFEWFErasdfgraeersdfgaw\naerd3qwerdre", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var vocabularyCells: [VocabularyCell] = [
        .init(image: UIImage(named: "fi-rr-book"), title: "Мои словари", vocabularies: vocabularies),
        .init(image: UIImage(named: "fitness 1"), title: "упражнения", vocabularies: vocabularies)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: backGroundMainColor)
        headerView.backgroundColor = UIColor(hex: backGroundOtherColor)
        accountImage.image = accountImage.image?.tinted(with: UIColor(hex: iconColor))
        reminder.image = reminder.image?.tinted(with: UIColor(hex: iconColor))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.frame
        tableView.backgroundColor = .none
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        
     setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.pin
            .height(134)
            .top()
            .left()
            .right()
        
        reminder.pin
            .below(of: headerView)
            .marginVertical(15)
            .size(24)
            .right(21.25)
        
        buttonHeader.pin
            .top(53)
            .left(19)
            .right(19)
            .bottom(5)
        
        buttonHeader.titleLabel?.pin
            .top()
            .right()

        if buttonHeader.titleLabel != nil  {
        accountImage.pin
            .size(24)
            .left(8)
            .bottom(41)
            
        }
        
        tableView.pin
            .below(of: headerView, aligned: .center)
            .left()
            .right()
            .bottom()
    }

    private func setup() {
        self.view.addSubview(headerView)
        self.view.addSubview(tableView)
        self.view.addSubview(reminder)
        self.headerView.addSubview(buttonHeader)
        self.buttonHeader.addSubview(accountImage)
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabularyCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "MainTableViewCell",
                for: indexPath) as? MainTableViewCell else { return .init() }
        
        cell.configure(with: vocabularyCells[indexPath.row])
        //cell.textLabel?.text = "123"
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 248
    }
    
}



