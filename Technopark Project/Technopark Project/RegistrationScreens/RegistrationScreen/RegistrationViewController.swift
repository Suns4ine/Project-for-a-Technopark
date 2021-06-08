//
//  RegistrationViewController.swift
//  Technopark Project
//
//  Created by Михаил Попов on 01.06.2021.
//

import Foundation
import PinLayout
import UIKit

class RegistrationViewController: UIViewController {
    
    private lazy var registrationHeadView = RegistrationHeadView(frame: .zero, root: self, model: .init(name: "Регистрация", subtitle: "Войти"))
    
    private let cells: [RegistrationViewModel] = [.init(nameCell: "Имя"),
                                                  .init(nameCell: "Фамилия"),
                                                  .init(nameCell: "Адрес электронной почты"),
                                                  .init(nameCell: "Новый пароль"),
                                                  .init(nameCell: "Повтор пароля")
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private let continueLabelButton: UILabel = {
        let label = UILabel()
        label.text = "Дальше"
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .smallButtonFont
        return label
    }()
       
    private let continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .buttonColor
        button.layer.cornerRadius = 24
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 1
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backGroundOtherColor
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RegistrationTableViewCell.self, forCellReuseIdentifier: "RegistrationTableViewCell")
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        registrationHeadView.pin
            .height(143)
            .top()
            .horizontally(20)
        
        tableView.pin
            .below(of: registrationHeadView)
            .marginVertical(63)
            .height(393)
            .left()
            .right()
        
        continueButton.pin
            .height(50)
            .width(336)
            .below(of: tableView)
            .marginVertical(42)
            .left(20)
        
        continueLabelButton.pin
            .center()
            .sizeToFit()
    }
    
    private func setup(){
        [registrationHeadView, tableView, continueButton].forEach {
            view.addSubview($0)
        }
        continueButton.addSubview(continueLabelButton)
    }
}

extension RegistrationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: "RegistrationTableViewCell",
                    for: indexPath) as? RegistrationTableViewCell else { return .init() }
        
        cell.configure(with: cells[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        }
}
