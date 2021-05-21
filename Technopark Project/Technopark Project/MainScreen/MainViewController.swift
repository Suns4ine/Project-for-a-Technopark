//
//  ViewController.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 07.04.2021.
//

import UIKit
import PinLayout

class MainViewController: UIViewController {
    
    private var vocabularies: [Vocabulary] = [.init(name: "Растения", status: 100, succses: true) , .init(name: "Глаголы", status: 56, succses: false), .init(name: "Учеба", status: 12, succses: false), .init(name: "Школа", status: 99, succses: false)]
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.alwaysBounceVertical = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    private var headerView = HeaderView(frame: .zero, account:
                                            Account(firstName: "Николай",
                                            lastName: "Шумкин", vocabulary: []))
    private var reminder: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fi-rr-bell 1")
        imageView.image = imageView.image?.tinted(with: UIColor(hex: iconColor))
        return imageView
    }()
    
    private lazy var vocabularyCells: [EducationalMaterialModel] = [
        .init(image: UIImage(named: "fi-rr-book"), title: "Мои словари", material: [].newArrayEducation(ar: vocabularies)),
        .init(image: UIImage(named: "fitness 1"), title: "Упражнения", material: [.exercises(.init(name: "Уить слова")), .exercises(.init(name: "Хардкор")), .exercises(.init(name: "10 слов дня")), .exercises(.init(name: "Салянка"))])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: backGroundMainColor)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.frame
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
        
        tableView.pin
            .below(of: headerView, aligned: .center)
            .bottom()
    }

    private func setup() {
        [headerView, tableView, reminder].forEach{
            self.view.addSubview($0)
        }
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    //Колличество ячейек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabularyCells.count
    }
    //Вид ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "MainTableViewCell",
                for: indexPath) as? MainTableViewCell else { return .init() }
        
        cell.configure(with: vocabularyCells[indexPath.row])
        return cell
    }
    //Высота ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 298
    }
    
}
