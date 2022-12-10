//
//  LoginViewController.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 09/12/2022.
//


import UIKit

class LoginViewController: UIViewController {
    
    lazy var createAccountView = UIView()
    lazy var backButton = UIButton()
    lazy var loginTitle = CustomLabel(text: MintynText.loginTitle.text, font: .systemFont(ofSize: 18, weight: .bold))
    
    lazy var insuranceView = MintynCustonView()
    lazy var openAccountView = MintynCustonView()
    lazy var businessRegistrationView = MintynCustonView()
    lazy var contactSupportView = MintynCustonView()
    
    lazy var firstHorizontalStack = CustomStackView(views: [insuranceView, openAccountView], spacing: 10)
    lazy var secondHorizontalStack = CustomStackView(views: [businessRegistrationView, contactSupportView])
    lazy var firstVerticaltack = CustomStackView(views: [firstHorizontalStack, secondHorizontalStack], axis: .vertical)
    
    lazy var phoneLabel = CustomLabel(text: MintynText.phoneNumber.text)
    lazy var phonetextField = MintynNumberTextField()

    lazy var passwordLabel = CustomLabel(text: MintynText.passwordText.text)
    lazy var passwordTextField = MintynPasswordTextField()
    
    lazy var checkButton = CustomButton(image: UIImage())
    lazy var checkButtonDescription = CustomLabel(text: MintynText.checkButtondescription.text)

    lazy var loginButton = CustomButton(text: MintynText.loginText.text)
    lazy var forgetButton = CustomButton(text: MintynText.forgetPassword.text)
    
    lazy var registerNewDeviceButton = CustomButton(text: MintynText.registerNewDevice.text)
    lazy var poweredByLabel = CustomLabel(text: MintynText.poweredByFinex.text, font: .systemFont(ofSize: 10, weight: .regular))
    lazy var versionLabel = CustomLabel(text: "Version 1.2.97", font: .systemFont(ofSize: 8, weight: .semibold))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewMode()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        
        checkButton.setImage(UIImage(systemName: ""), for: .normal)
        checkButton.setImage(UIImage(systemName: "checkmark"), for: .selected)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        [createAccountView, backButton, loginTitle, firstVerticaltack].forEach { newView in
            view.addSubview(newView)
        }
        setupCreateAccountView()
        setupTitle()
        setupBackButton()
        setupInsuranceView()
    }
    
    func setupCreateAccountView() {
        createAccountView.setViewConstraints(right: view.trailingAnchor, bottom: view.bottomAnchor, left: view.leadingAnchor, height: view.bounds.height * 0.55)
        createAccountView.backgroundColor = .white
        createAccountView.cornerRadius = 30
        
        [
            phoneLabel, phonetextField, passwordLabel,
            passwordTextField, checkButton, checkButtonDescription,
            loginButton, forgetButton, registerNewDeviceButton,
            poweredByLabel, versionLabel
        ].forEach { newView in
            createAccountView.addSubview(newView)
        }
        
        setupCreateAccountUIViews()
    }
    
    func setupBackButton() {
        backButton.setViewConstraints(top: view.topAnchor, left: view.leadingAnchor, paddingTop: 40, paddingLeft: 20, width: 30, height: 30)
        backButton.cornerRadius = 15
        backButton.backgroundColor = .mintynLightBrownColor
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.tintColor = .mintynDefaultBrownColor
        backButton.addTarget(self, action: #selector(backButtontapped), for: .touchUpInside)
    }
    
    func setupTitle() {
        loginTitle.setViewConstraints(top: backButton.topAnchor, paddingTop: 5)
        loginTitle.setCenterAnchor(horizontal: view.centerXAnchor)
    }
    
    func setupCreateAccountUIViews() {
        setupPhoneLabel()
        setupPhonetextField()
        
        setupPasswordLabel()
        setupPasswordTextField()
        setupCheckButton()
        setupCheckButtondescription()
        setupContinueButton()
        setupForgetButton()
        setupRegisterNewDeviceButton()
        setupPoweredByLabel()
        setupVersionLabel()
        
        setupInsuranceView()
        setupOpenAccountView()
        setupBusinessRegistrationView()
        setupContactSupportView()
        
        setupFirstVerticaltack()
    }
    
    func setupPhoneLabel() {
        phoneLabel.setViewConstraints(top: createAccountView.topAnchor, left: createAccountView.leadingAnchor, paddingTop: 50, paddingLeft: 20)
    }
    
    func setupPhonetextField() {
        phonetextField.setViewConstraints(top: phoneLabel.bottomAnchor, right: createAccountView.trailingAnchor, left: phoneLabel.leadingAnchor,paddingTop: 10, paddingRight: 20, height: 50)
        phonetextField.layer.borderWidth = 2
        phonetextField.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
    }
    
    
    func setupPasswordLabel() {
        passwordLabel.setViewConstraints(top: phonetextField.bottomAnchor, left: createAccountView.leadingAnchor, paddingTop: 30, paddingLeft: 20)
    }
    
    func setupPasswordTextField() {
        passwordTextField.setViewConstraints(top: passwordLabel.bottomAnchor, right: phonetextField.trailingAnchor, left: phonetextField.leadingAnchor,paddingTop: 10, height: 40)
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        passwordTextField.passwordTextField.isSecureTextEntry = true
    }
    
    func setupContinueButton() {
        let layer = loginButton.applyGradient(colours: [.mintynLightBrownColor2, .mintynDefaultBrownColor])
        loginButton.layer.insertSublayer(layer, at: 0)
        
        loginButton.setViewConstraints(top: checkButton.bottomAnchor, right: passwordTextField.trailingAnchor, left: passwordTextField.leadingAnchor, paddingTop: 20)
        loginButton.setCenterAnchor(horizontal: createAccountView.centerXAnchor)
        loginButton.setSize(height: 45)
        loginButton.cornerRadius = 10
    }
    
    func setupCheckButton() {
        checkButton.layer.borderWidth = 2
        checkButton.cornerRadius = 5
        
        checkButton.setViewConstraints(top: passwordTextField.bottomAnchor, left: passwordTextField.leadingAnchor, paddingTop: 30)
        checkButton.setSize(width: 20, height: 20)
        checkButton.addTarget(self, action: #selector(checkButtonTapped(_:)), for: .touchUpInside)
    }
    
    func setupCheckButtondescription() {
        checkButtonDescription.setViewConstraints(top: checkButton.topAnchor, bottom: checkButton.bottomAnchor, left: checkButton.trailingAnchor, paddingLeft: 10)
        checkButtonDescription.textColor = .lightGray
    }
    
    func setupInsuranceView() {
        insuranceView.setSize(width: (view.bounds.width - 50) * 0.5, height: view.bounds.width * 0.225)
        insuranceView.isComingSoon = true
        insuranceView.customTitle = "Insurance"
        insuranceView.customButton.addTarget(self, action: #selector(insuranceViewTapped(_:)), for: .touchUpInside)
    }
    
    func setupOpenAccountView() {
        openAccountView.setSize(width: (view.bounds.width - 50) * 0.5, height: view.bounds.width * 0.225)
        openAccountView.isComingSoon = false
        openAccountView.customTitle = "Open an\nAccount"
        openAccountView.customButton.addTarget(self, action: #selector(openAccountViewTapped(_:)), for: .touchUpInside)
    }
    
    func setupBusinessRegistrationView() {
        businessRegistrationView.setSize(width: (view.bounds.width - 50) * 0.5, height: view.bounds.width * 0.225)
        businessRegistrationView.isComingSoon = false
        businessRegistrationView.customTitle = "CAC Business\nRegistration"
        businessRegistrationView.image = "copy"
        businessRegistrationView.customButton.addTarget(self, action: #selector(businessRegViewTapped(_:)), for: .touchUpInside)
    }
    
    func setupContactSupportView() {
        contactSupportView.setSize(width: (view.bounds.width - 50) * 0.5, height: view.bounds.width * 0.225)
        contactSupportView.isComingSoon = false
        contactSupportView.customTitle = "Contact\nSupport"
        contactSupportView.image = "headset"
        contactSupportView.customButton.addTarget(self, action: #selector(contactSupportViewTapped(_:)), for: .touchUpInside)
    }
    
    func setupFirstVerticaltack() {
        firstVerticaltack.setViewConstraints(top: loginTitle.bottomAnchor, right: view.trailingAnchor, left: view.leadingAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20)
    }
    
    func setupForgetButton() {
        forgetButton.setViewConstraints(top: checkButton.topAnchor, right: passwordTextField.trailingAnchor, bottom: checkButton.bottomAnchor)
        forgetButton.setTitleColor(.mintynDefaultBrownColor, for: .normal)
        
        forgetButton.addTarget(self, action: #selector(forgetButtonTapped(_:)), for: .touchUpInside)
    }
    
    func setupRegisterNewDeviceButton() {
        registerNewDeviceButton.setViewConstraints(top: loginButton.bottomAnchor, paddingTop: 30, height: 35)
        registerNewDeviceButton.setCenterAnchor(horizontal: createAccountView.centerXAnchor)
        registerNewDeviceButton.setTitleColor(.mintynDefaultBrownColor, for: .normal)
        registerNewDeviceButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        
        registerNewDeviceButton.addTarget(self, action: #selector(registerNewDeviceButtonTapped(_:)), for: .touchUpInside)
    }
    
    func setupPoweredByLabel() {
        poweredByLabel.setViewConstraints(top: registerNewDeviceButton.bottomAnchor, paddingTop: -8)
        poweredByLabel.setCenterAnchor(horizontal: createAccountView.centerXAnchor)
        poweredByLabel.textColor = .lightGray
    }
    
    func setupVersionLabel() {
        versionLabel.setViewConstraints(top: poweredByLabel.bottomAnchor, paddingTop: 10)
        versionLabel.setCenterAnchor(horizontal: createAccountView.centerXAnchor)
    }
    
    @objc func backButtontapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func checkButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @objc func contactSupportViewTapped(_ sender: UIButton) {
        let supportVC = SupportViewController()
        self.navigationController?.pushViewController(supportVC, animated: true)
    }
    
    @objc func insuranceViewTapped(_ sender: UIButton) {
        print("Insurance tapped")
    }
    
    @objc func openAccountViewTapped(_ sender: UIButton) {
        print("Open account tapped")
        let openAccountVC = CreateAccountView()
        self.navigationController?.pushViewController(openAccountVC, animated: false)
    }
    
    @objc func businessRegViewTapped(_ sender: UIButton) {
        print("Business Registration tapped")
    }
    
    @objc func forgetButtonTapped(_ sender: UIButton) {
        print("Forget button tapped")
    }
    
    @objc func registerNewDeviceButtonTapped(_ sender: UIButton) {
        print("New registration tapped")
        let registerVC = RegisterNewDeviceVC()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
}
