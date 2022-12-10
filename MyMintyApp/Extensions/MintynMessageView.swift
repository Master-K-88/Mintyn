//
//  MintynMessageView.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 10/12/2022.
//

import UIKit

class MintynMessageView: UIView {
    
    lazy var fromPersonTitleLabel = CustomLabel(text: "Support")
    lazy var fromPersonIcon = CustomImageView(image: UIImage())
    lazy var fromPersonMessage = PaddingLabel()
    
    public var image: String = "" {
        didSet {
            fromPersonIcon.image = UIImage(named: image) ?? UIImage()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        fromPersonMessage.cornerRadius = 10
        fromPersonMessage.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        [fromPersonTitleLabel, fromPersonIcon, fromPersonMessage].forEach { newView in
            addSubview(newView)
        }
        setupUIs()
    }
    
    func setupUIs() {
        setupFromPersonTitleLabel()
        setupFromPersonIcon()
        setupFromPersonMessage()
    }
    
    func setupFromPersonTitleLabel() {
        fromPersonTitleLabel.setViewConstraints(top: topAnchor, left: fromPersonIcon.trailingAnchor, paddingTop: 5, paddingLeft: 10)
    }
    
    func setupFromPersonIcon() {
        fromPersonIcon.setViewConstraints(left: leadingAnchor, paddingLeft: 10, width: 40, height: 40)
        fromPersonIcon.setCenterAnchor(vertical: centerYAnchor)
    }
    
    func setupFromPersonMessage() {
        fromPersonMessage.setViewConstraints(top: fromPersonTitleLabel.bottomAnchor, right: trailingAnchor, bottom: bottomAnchor, left: fromPersonTitleLabel.leadingAnchor, paddingTop: 5)
        fromPersonMessage.backgroundColor = .mintynMesageBGColor
    }
    
    
}
