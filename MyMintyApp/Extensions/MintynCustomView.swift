//
//  MintynCustomView.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 10/12/2022.
//

import UIKit

class MintynCustonView: UIView {
    
    lazy var customViewTitle = CustomLabel(text: "", font: .systemFont(ofSize: 13))
    lazy var comingSoonLabel = CustomLabel(text: "Coming soon...")
    lazy var customViewImage = CustomImageView(image: UIImage(named: "shield") ?? UIImage())
    public lazy var customButton = CustomButton(image: UIImage())
    
    public var customTitle: String = "" {
        didSet {
            customViewTitle.text = customTitle
        }
    }
    
    public var isComingSoon: Bool = false {
        didSet {
            comingSoonLabel.isHidden = !isComingSoon
        }
    }
    
    public var image: String = "" {
        didSet {
            customViewImage.image = UIImage(named: image) ?? UIImage()
            customViewImage.tintColor = .mintynDefaultBrownColor
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layer = self.applyVerticalGradient(colours: [.white, .white.withAlphaComponent(0.2)])
        self.layer.insertSublayer(layer, at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        [ customViewTitle, comingSoonLabel, customViewImage, customButton].forEach { newView in
            addSubview(newView)
        }
        
        setupCustomViewImage()
        setupCustomViewTitle()
        setupComingSoonLabel()
        setupCustomButton()
    }
    
    func setupCustomViewImage() {
        customViewImage.setCenterAnchor(vertical: centerYAnchor)
        customViewImage.setSize(width: 30, height: 30)
        customViewImage.setViewConstraints(left: leadingAnchor, paddingLeft: 30)
    }
    
    func setupCustomViewTitle() {
        customViewTitle.setViewConstraints(top: customViewImage.topAnchor, left: customViewImage.trailingAnchor, paddingTop: 5, paddingLeft: 10)
        customViewTitle.textAlignment = .center
    }
    
    func setupComingSoonLabel() {
        comingSoonLabel.setViewConstraints(top: customViewTitle.bottomAnchor, left: customViewImage.trailingAnchor, paddingLeft: 5)
        comingSoonLabel.textColor = .lightGray
    }
    
    func setupCustomButton() {
        customButton.pin(to: self)
    }
    
}
