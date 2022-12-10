//
//  MintynLoginView.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 09/12/2022.
//


import UIKit

class MintynLoginView: UIView {
    
    lazy var mintynWelcomeLabbel = CustomLabel(text: MintynText.welcomeText.text, font: .systemFont(ofSize: 28, weight: .bold))
    lazy var mintynMoreInfoLabel = CustomLabel(text: MintynText.moreInfo.text, font: .systemFont(ofSize: 18, weight: .regular))
    
    public lazy var loginButton = CustomButton(text: MintynText.loginText.text)
    public lazy var createAccountButton = CustomButton(text: MintynText.createAccountText.text)
    
    lazy var mintynVersionInfoLabel = CustomLabel(text: MintynText.versionInfo.text, font: .systemFont(ofSize: 12, weight: .regular))
    
    let gl: CAGradientLayer = CAGradientLayer()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLoginView()
    }
    
    func setupLoginView() {
        [mintynWelcomeLabbel, mintynMoreInfoLabel, mintynVersionInfoLabel].forEach { customLabel in
            addSubview(customLabel)
            customLabel.textAlignment = .center
        }
        
        [loginButton, createAccountButton].forEach { button in
            addSubview(button)
        }
        
        setupWelcomeLabel()
        setupMoreInfoLabel()
        setupMintynLoginButton()
        setupCreateAccountButton()
        setupVersionInfoLabel()
    }
    
    func setupWelcomeLabel() {
        mintynWelcomeLabbel.setViewConstraints(top: topAnchor, paddingTop: 70)
        mintynWelcomeLabbel.setCenterAnchor(horizontal: centerXAnchor)
    }
    
    func setupMoreInfoLabel() {
        mintynMoreInfoLabel.setViewConstraints(top: mintynWelcomeLabbel.bottomAnchor, paddingTop: 5)
        mintynMoreInfoLabel.setCenterAnchor(horizontal: centerXAnchor)
    }
    
    func setupMintynLoginButton() {
        let layer = loginButton.applyGradient(colours: [.mintynLightBrownColor, .mintynDefaultBrownColor])
        loginButton.layer.insertSublayer(layer, at: 0)
        
        loginButton.setViewConstraints(top: mintynMoreInfoLabel.bottomAnchor, paddingTop: 20)
        loginButton.setCenterAnchor(horizontal: centerXAnchor)
        loginButton.setSize(width: self.bounds.width * 0.8, height: 40)
        loginButton.cornerRadius = 10
        
        
    }
    
    func setupCreateAccountButton() {
        createAccountButton.backgroundColor = .black
        createAccountButton.cornerRadius = 10
        createAccountButton.setViewConstraints(
            top: loginButton.bottomAnchor,
            right: loginButton.trailingAnchor,
            left: loginButton.leadingAnchor,
            paddingTop: 10)
        createAccountButton.setCenterAnchor(horizontal: centerXAnchor)
        createAccountButton.setSize(height: 40)
    }
    
    func setupVersionInfoLabel() {
        mintynVersionInfoLabel.setViewConstraints(top: createAccountButton.bottomAnchor, paddingTop: 50)
        mintynVersionInfoLabel.setCenterAnchor(horizontal: centerXAnchor)
    }
}
