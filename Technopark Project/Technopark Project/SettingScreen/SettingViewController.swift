//
//  SettingController.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 22.05.2021.
//

import Foundation
import UIKit
import PinLayout

class SettingViewController: UIViewController {
    
    private var account: Account?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColorLight
        label.font = .standartFont
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private var arrayNames = ["Уведомления", "Звук в приложении", "Тема", "Очистить кэш", "О приложении"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backGroundSettingColor
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "SettingTableViewCell")
        
        setup()
    }
    
    
    func configure(with model: SettingViewModel) {
        self.account = model.account
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        titleLabel.pin
            .top(22)
            .left(22)
            .right(22)
            .height(self.view.frame.height * 0.15)
        
        tableView.pin
            .below(of: titleLabel)
            .marginVertical(22)
            .left(37)
            .right(37)
            .bottom(view.pin.safeArea.bottom + 22)
    }
    
    private func setup() {
        [titleLabel, tableView].forEach{ self.view.addSubview($0) }
        
        arrayNames += account != nil ? ["Выйти", "Назад"] : ["Войти", "Назад"]
        titleLabel.text = account != nil ?
            "\(String(describing: account!.firstName)) \(String(describing: account!.lastName))" :
            "\(Bundle.appName())"
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: "SettingTableViewCell",
                    for: indexPath) as? SettingTableViewCell else { return .init() }
        
        cell.configure(with: self, nameCell: arrayNames[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return arrayNames[indexPath.row].count > 19 ? 108 : 68
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        }
}
