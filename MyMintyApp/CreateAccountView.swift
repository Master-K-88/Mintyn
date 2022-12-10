//
//  CreateAccountView.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 09/12/2022.
//

import UIKit

class CreateAccountView: UIViewController {
    
    lazy var bgView = UIView()
    lazy var createAccountView = UIView()
    lazy var backButton = UIButton()
    lazy var createAccountTitle = CustomLabel(text: MintynText.createAcoountTitle.text, font: .systemFont(ofSize: 18, weight: .bold))
    
    lazy var createAccountInfo = CustomLabel(text: MintynText.createAccountInfo.text, font: .systemFont(ofSize: 12, weight: .regular))
    lazy var phoneLabel = CustomLabel(text: MintynText.phoneNumber.text)
    lazy var phonetextField = MintynNumberTextField()
    lazy var continueButton = CustomButton(text: MintynText.continueText.text)
    lazy var registerButton = CustomButton(text: "Register your business")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bgView)
        bgView.setViewConstraints(top: view.topAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, left: view.leadingAnchor)
        setViewMode()
        bgView.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        [createAccountView, backButton, createAccountTitle].forEach { newView in
            bgView.addSubview(newView)
        }
        setupCreateAccountView()
        setupTitle()
        setupBackButton()
    }
    
    func setupCreateAccountView() {
        createAccountView.setViewConstraints(right: bgView.trailingAnchor, bottom: bgView.bottomAnchor, left: bgView.leadingAnchor, height: bgView.bounds.height * 0.55)
        createAccountView.backgroundColor = .white
        createAccountView.cornerRadius = 30
        
        [createAccountInfo, phoneLabel, phonetextField, continueButton, registerButton].forEach { newView in
            createAccountView.addSubview(newView)
        }
        
        setupCreateAccountUIViews()
    }
    
    func setupBackButton() {
        backButton.setViewConstraints(top: bgView.topAnchor, left: bgView.leadingAnchor, paddingTop: 40, paddingLeft: 20, width: 30, height: 30)
        backButton.cornerRadius = 15
        backButton.backgroundColor = .mintynLightBrownColor
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.tintColor = .mintynDefaultBrownColor
        backButton.addTarget(self, action: #selector(backButtontapped), for: .touchUpInside)
    }
    
    func setupTitle() {
        createAccountTitle.setViewConstraints(top: backButton.topAnchor, paddingTop: 5)
        createAccountTitle.setCenterAnchor(horizontal: bgView.centerXAnchor)
    }
    
    func setupCreateAccountUIViews() {
        setupCreateAccountInfo()
        setupPhoneLabel()
        setupPhonetextField()
        setupContinueButton()
        setupRegisterButton()
    }
    
    func setupCreateAccountInfo() {
        createAccountInfo.setViewConstraints(top: createAccountView.topAnchor, paddingTop: 20)
        createAccountInfo.setCenterAnchor(horizontal: createAccountView.centerXAnchor)
        createAccountInfo.textAlignment = .center
    }
    
    func setupPhoneLabel() {
        phoneLabel.setViewConstraints(top: createAccountInfo.bottomAnchor, left: createAccountView.leadingAnchor, paddingTop: 50, paddingLeft: 20)
    }
    
    func setupPhonetextField() {
        phonetextField.setViewConstraints(top: phoneLabel.bottomAnchor, right: createAccountView.trailingAnchor, left: phoneLabel.leadingAnchor,paddingTop: 10, paddingRight: 20, height: 40)
        phonetextField.layer.borderWidth = 2
        phonetextField.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
    }
    
    func setupContinueButton() {
        let layer = continueButton.applyGradient(colours: [.mintynLightBrownColor2, .mintynDefaultBrownColor])
        continueButton.layer.insertSublayer(layer, at: 0)
        
        continueButton.setViewConstraints(top: phonetextField.bottomAnchor, right: phonetextField.trailingAnchor, left: phonetextField.leadingAnchor, paddingTop: 20)
        continueButton.setCenterAnchor(horizontal: createAccountView.centerXAnchor)
        continueButton.setSize(height: 45)
        continueButton.cornerRadius = 10
    }
    
    func setupRegisterButton() {
        registerButton.setViewConstraints(top: continueButton.bottomAnchor, right: continueButton.trailingAnchor, left: continueButton.leadingAnchor, paddingTop: 130, height: 45)
        registerButton.backgroundColor = .black
        registerButton.cornerRadius = 10
    }
    @objc func backButtontapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
