//
//  MintynTextField.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 09/12/2022.
//

import UIKit

class MintynNumberTextField: UIView {
    
    lazy var imageView = CustomImageView(image: UIImage(named: "flag") ?? UIImage())
    lazy var numberLabel = CustomLabel(text: "+234")
    public lazy var numberTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white.withAlphaComponent(0.8)
        [imageView, numberLabel, numberTextField].forEach { newView in
            addSubview(newView)
        }
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius = bounds.height * 0.25
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        setupImageView()
        setupNumber()
        setupTextField()
    }
    
    func setupImageView() {
        imageView.setViewConstraints(left: leadingAnchor, paddingLeft: 10)
        imageView.setCenterAnchor(vertical: centerYAnchor, height: heightAnchor, heightMultiplier: 0.4)
        imageView.setSize(width: 25)
    }
    
    func setupNumber() {
        numberLabel.setViewConstraints(left: imageView.trailingAnchor, paddingLeft: 10, width: 33)
        numberLabel.setCenterAnchor(vertical: centerYAnchor, height: heightAnchor, heightMultiplier: 0.7)
        numberLabel.textColor = .gray.withAlphaComponent(0.8)
    }
    
    func setupTextField() {
        numberTextField.setViewConstraints(top: topAnchor, right: trailingAnchor, bottom: bottomAnchor, left: numberLabel.trailingAnchor, paddingLeft: 5)
        numberTextField.placeholder = "802 123 4567"
    }
}
