//
//  MintynPasswordTextField.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 09/12/2022.
//

import UIKit

class MintynPasswordTextField: UIView {
    
    public lazy var showHideButton = CustomButton(image: UIImage(systemName: "eye") ?? UIImage())
    public lazy var passwordTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white.withAlphaComponent(0.8)
        [showHideButton, passwordTextField].forEach { newView in
            addSubview(newView)
        }
        setupViews()
        
        showHideButton.setImage(UIImage(systemName: "eye"), for: .normal)
        showHideButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
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
        setupTextField()
    }
    
    func setupImageView() {
        showHideButton.setViewConstraints(right: trailingAnchor, paddingRight: 10)
        showHideButton.setCenterAnchor(vertical: centerYAnchor)
        showHideButton.setSize(width: 25, height: 25)
        
        
        
        showHideButton.addTarget(self, action: #selector(showHidePassword(_:)), for: .touchUpInside)
    }
    
    func setupTextField() {
        passwordTextField.setViewConstraints(top: topAnchor, right: showHideButton.leadingAnchor, bottom: bottomAnchor, left: leadingAnchor, paddingLeft: 10, paddingRight: 5)
        passwordTextField.placeholder = "password"
    }
    
    @objc private func showHidePassword(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        DispatchQueue.main.async {
            self.passwordTextField.isSecureTextEntry = !sender.isSelected
        }
        
    }
}
