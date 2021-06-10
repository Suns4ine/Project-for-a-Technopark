//
//  DeleteHeaderView.swift
//  Technopark Project
//
//  Created by Михаил Попов on 10.06.2021.
//

import Foundation
import PinLayout
import UIKit

final class DeleteHeaderView: UIView {
    
    weak var delegate: HeaderDelegate?
    
    private let crossButton = UIButton()
    
    private let crossIcon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "fi-rr-cross 1")
        icon.image = icon.image?.tinted(with: .iconColor)
        return icon
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .standartFont
        label.textColor = .textColorLight
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    init(frame: CGRect, root: UIViewController, model: HeaderModel) {
        super.init(frame: frame)
        
        titleLabel.text = model.name
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        crossButton.pin
            .size(24)
            .right(21)
            .vCenter()
        
        crossIcon.pin
            .size(24)
            .center()
        
        titleLabel.pin
            .center()
            .height(60)
            .width(180)
        
    }
    
    private func setup () {
        [crossButton, titleLabel].forEach{
            self.addSubview($0)
        }
        
        crossButton.addSubview(crossIcon)
        
        crossButton.addTarget(self, action: #selector(moveBack), for: .touchUpInside)
    }
    
    @objc
    private func moveBack() {
        delegate?.moveBack?()
    }
}
