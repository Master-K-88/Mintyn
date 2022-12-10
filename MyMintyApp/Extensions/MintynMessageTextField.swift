//
//  MintynMessageTextField.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 10/12/2022.
//

import UIKit

class MintynmessageTextField: UIView {
    
    lazy var attchFileButton = CustomButton(image: UIImage(systemName: "paperclip") ?? UIImage())
    lazy var messageTextField = UITextView()
    lazy var sendButton = CustomButton(image: UIImage(named: "plane") ?? UIImage())
    
    lazy var poweredByLabel = CustomLabel(text: "Powered by ", font: .systemFont(ofSize: 10, weight: .regular))
    lazy var poweredByIcon = CustomImageView(image: UIImage(named: "freshworks") ?? UIImage())
    lazy var freshworksLabel = CustomLabel(text: "freshworks", font: .systemFont(ofSize: 10, weight: .regular))
    lazy var poweredByStack = CustomStackView(views: [poweredByLabel, poweredByIcon, freshworksLabel], mode: .center, distribution: .fillProportionally, spacing: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        [attchFileButton, messageTextField, sendButton, poweredByStack].forEach { newView in
            addSubview(newView)
        }
        setupAttachedFileIcon()
        setupSendButton()
        setupTextField()
        setupPoweredByStack()
        
    }
    
    func setupAttachedFileIcon() {
        attchFileButton.setViewConstraints(bottom: bottomAnchor, left: leadingAnchor, paddingLeft: 10, paddingBottom: 10, width: 50, height: 50)
    }
    
    func setupSendButton() {
        sendButton.setViewConstraints(right: trailingAnchor, bottom: bottomAnchor, paddingBottom: 10, paddingRight: 20, width: 50, height: 50)
    }
    
    func setupTextField() {
        messageTextField.setViewConstraints(top: topAnchor, right: sendButton.leadingAnchor, bottom: bottomAnchor, left: attchFileButton.trailingAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 10, paddingRight: 5, height: 50)
    }
    
    func setupPoweredByStack() {
        poweredByStack.setViewConstraints(top: messageTextField.bottomAnchor, paddingTop: 5,width: 150, height: 18)
        poweredByIcon.setSize(width: 15, height: 15)
        poweredByLabel.setSize(width: 60, height: 15)
        
        freshworksLabel.setSize(height: 15)
        poweredByLabel.textColor = .black
        freshworksLabel.textColor = .black
        poweredByStack.setCenterAnchor(horizontal: centerXAnchor)
    }
}
