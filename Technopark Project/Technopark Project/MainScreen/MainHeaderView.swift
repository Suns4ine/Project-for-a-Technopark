//
//  HeaderView.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 21.05.2021.
//

import Foundation
import UIKit
import PinLayout

final class MainHeaderView: UIView {
    
    private var rootController: MainViewController!
    private var account: Account?
    private let buttonSetting = UIButton()
    
    private lazy var labelNamed: UILabel = {
        let label = UILabel()
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .standartFont
        return label
    }()
    
    private let iconAccount: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fi-rr-user 1")
        imageView.image = imageView.image?.tinted(with: .iconColor)
        return imageView
    }()
    
    init(frame: CGRect, account: Account?, root: MainViewController) {
        super.init(frame: frame)
        self.account = account
        self.rootController = root
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        buttonSetting.pin
            .top(35)
            .left(19)
            .right(19)
            .bottom(5)
        
        labelNamed.pin
            .height(buttonSetting.frame.height - 12)
            .width(buttonSetting.frame.width - 10 - iconAccount.frame.width)
            .top()
            .hCenter()
        
        if account != nil {
            iconAccount.pin
                .size(24)
                .left(8)
                .bottom(41)
        }
    }
    
    func configure(wuth model: SettingViewModel) {
        account = model.account
        rootController = model.root
    }
    
    private func setup() {
        self.addSubview(buttonSetting)
        [iconAccount, labelNamed].forEach { buttonSetting.addSubview($0) }
        
        backgroundColor = .backGroundOtherColor
        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
        
        buttonSetting.addTarget(self, action: #selector(newSettingController), for: .touchUpInside)
        
        labelNamed.text = account != nil ?
            "\(String(describing: account!.firstName)) \(String(describing: account!.lastName))" :
            "\(Bundle.appName())"
    }
    
    @objc
    private func newSettingController() {
//        guard let v = rootController.next as? MainViewController else {
//            return
//        }
        
        let vc = SettingViewController()
        vc.configure(with: .init(account: account, root: rootController))
        
        //let vc = LessonViewController()
        
        let transition = CATransition()
        transition.duration = 0.7
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        self.window!.layer.add(transition, forKey: kCATransition)
        self.rootController.present(vc, animated: false, completion: nil)
        //vc.dismiss(animated: true, completion: nil)
        //let navigationController = UINavigationController(rootViewController: vc)
        //UIViewController(nibName: "SettingViewController", bundle: nil)
                //as? SettingViewController else { return }
        //self.rootController.navigationController?.pushViewController(vc, animated: true)
        
       // self.rootController.navigationController?.pushViewController(vc, animated: false)
        
        //self.rootViewController.present(navigationController, animated: true)
    }
}
