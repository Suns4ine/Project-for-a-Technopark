//
//  ViewController.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 07.04.2021.
//

import UIKit
import PinLayout

class MainViewController: UIViewController {
    
    private let container = UIView()
    
    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "verba-logo")
        return logo
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "VERBA"
        label.font = .logoFont
        label.textColor = .darkText
        label.textAlignment = .center
        return label
    }()
    
    //Первая кнопка
    private let logInlabelButton: UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .smallButtonFont
        return label
    }()
       
    private let logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .buttonColor
        button.layer.cornerRadius = 24
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 1
        return button
    }()
    
    //Вторая кнопка
    private let signUplabelButton: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .smallButtonFont
        return label
    }()
       
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .buttonColor
        button.layer.cornerRadius = 24
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 1
        return button
    }()
    
    //Третья кнопка
    private let skiplabelButton: UILabel = {
        let label = UILabel()
        label.text = "Skip"
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .smallButtonFont
        return label
    }()
       
    private let skipButton: UIButton = {
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
        
        setup()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        logo.pin
            .top(190)
            .hCenter()
            .size(225)
        
        titleLabel.pin
            .below(of: logo)
            .marginVertical(4)
            .height(57)
            .width(136)
            .hCenter()
        
        container.pin
            .height(188)
            .left()
            .bottom()
            .right()
        
        //Кнопки
        signUpButton.pin
            .height(51)
            .width(125)
            .top()
            .left(55)
        
        logInButton.pin
            .height(51)
            .width(125)
            .top()
            .after(of: signUpButton)
            .marginHorizontal(14)
        
        skipButton.pin
            .height(51)
            .width(264)
            .below(of: signUpButton)
            .marginVertical(21)
            .left(55)
        
        //Лейблы кнопок
        logInlabelButton.pin
            .center()
            .sizeToFit()
        
        signUplabelButton.pin
            .center()
            .sizeToFit()
        
        skiplabelButton.pin
            .center()
            .sizeToFit()
    }
    
    private func setup(){
        [logo, titleLabel, container].forEach{
            view.addSubview($0)
        }
        [signUpButton, logInButton, skipButton].forEach{
            container.addSubview($0)
        }
        logInButton.addSubview(logInlabelButton)
        signUpButton.addSubview(signUplabelButton)
        skipButton.addSubview(skiplabelButton)
        
        logInButton.addTarget(self, action: #selector(logInDidTap), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpDidTap), for: .touchUpInside)
    }
    
    @objc
    private func logInDidTap(){
        let newViewController = LogInViewController()
        present(newViewController, animated: true, completion: nil)
        //self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc
    private func signUpDidTap(){
        let newViewController = RegistrationViewController()
        present(newViewController, animated: true, completion: nil)
        //self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
