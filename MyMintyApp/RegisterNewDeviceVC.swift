//
//  RegisterNewDeviceVC.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 10/12/2022.
//

import UIKit

class RegisterNewDeviceVC: UIViewController {
    
    lazy var backButton = UIButton()
    lazy var registerNewDeviceTitle = CustomLabel(text: MintynText.registerNewDevice.text, font: .systemFont(ofSize: 18, weight: .bold))
    
    lazy var registerNewDeviceIconBGView = UIView()
    lazy var registerNewDeviceIcon = CustomImageView(image: UIImage(systemName: "iphone") ?? UIImage())
    
    lazy var bvnLabel = CustomLabel(text: "BVN", font: .systemFont(ofSize: 16, weight: .regular))
    lazy var bvnTextfield = MintynTextField()
    
    lazy var numberLabel = CustomLabel(text: MintynText.phoneNumber.text, font: .systemFont(ofSize: 16, weight: .regular))
    lazy var numberTextField = MintynNumberTextField()
    
    lazy var passwordLabel = CustomLabel(text: MintynText.passwordText.text, font: .systemFont(ofSize: 16, weight: .regular))
    lazy var passwordTextfield = MintynPasswordTextField()
    
    lazy var continueButton = CustomButton(text: MintynText.continueText.text, font: .systemFont(ofSize: 16, weight: .semibold))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        
    }
    
    func setupViews() {
        [
            backButton, registerNewDeviceTitle, registerNewDeviceIconBGView,
            bvnLabel, bvnTextfield, numberLabel, numberTextField,
            passwordLabel, passwordTextfield, continueButton
        ].forEach { newView in
            view.addSubview(newView)
        }
        setupConstraints()
        
    }
    
    func setupConstraints() {
        setupBackButton()
        setupTitle()
        setupRegisterNewDeviceIconBGView()
        
        setupBVNLabel()
        setupBVNTextfield()
        
        setupNumberLabel()
        setupNumberTextfield()
        
        setupPasswordLabel()
        setupPasswordTextfield()
        
        setupContinueButton()
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
        registerNewDeviceTitle.setViewConstraints(top: backButton.topAnchor, paddingTop: 5)
        registerNewDeviceTitle.setCenterAnchor(horizontal: view.centerXAnchor)
    }
    
    func setupRegisterNewDeviceIconBGView() {
        registerNewDeviceIconBGView.addSubview(registerNewDeviceIcon)
        
        registerNewDeviceIconBGView.setViewConstraints(top: registerNewDeviceTitle.bottomAnchor, paddingTop: 50, width: 150, height: 150)
        registerNewDeviceIconBGView.cornerRadius = 75
        registerNewDeviceIconBGView.clipsToBounds = true
        
        registerNewDeviceIconBGView.setCenterAnchor(horizontal: view.centerXAnchor)
        registerNewDeviceIconBGView.backgroundColor = .mintynLightBrownColor.withAlphaComponent(0.2)
        setupRegisterNewDeviceIcon()
    }
    
    func setupRegisterNewDeviceIcon() {
        registerNewDeviceIcon.setCenterAnchor(vertical: registerNewDeviceIconBGView.centerYAnchor, horizontal: registerNewDeviceIconBGView.centerXAnchor)
        registerNewDeviceIcon.setSize(width: 75, height: 75)
        registerNewDeviceIcon.tintColor = .mintynDefaultBrownColor
    }
    
    func setupBVNLabel() {
        bvnLabel.setViewConstraints(top: registerNewDeviceIconBGView.bottomAnchor, left: view.leadingAnchor, paddingTop: 30, paddingLeft: 20)
    }
    
    func setupBVNTextfield() {
        bvnTextfield.setViewConstraints(top: bvnLabel.bottomAnchor, right: view.trailingAnchor, left: bvnLabel.leadingAnchor, paddingTop: 5, paddingRight: 20, height: 45)
        bvnTextfield.layer.borderWidth = 2
        bvnTextfield.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        bvnTextfield.placeHolder = "Enter your bvn"
        bvnTextfield.textfield.delegate = self
    }
    
    func setupNumberLabel() {
        numberLabel.setViewConstraints(top: bvnTextfield.bottomAnchor, left: bvnTextfield.leadingAnchor, paddingTop: 20)
    }
    
    func setupNumberTextfield() {
        numberTextField.setViewConstraints(top: numberLabel.bottomAnchor, right: bvnTextfield.trailingAnchor, left: bvnTextfield.leadingAnchor, paddingTop: 5, height: 40)
        numberTextField.layer.borderWidth = 2
        numberTextField.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        numberTextField.numberTextField.delegate = self
    }
    
    func setupPasswordLabel() {
        passwordLabel.setViewConstraints(top: numberTextField.bottomAnchor, left: numberTextField.leadingAnchor, paddingTop: 20)
    }
    
    func setupPasswordTextfield() {
        passwordTextfield.setViewConstraints(top: passwordLabel.bottomAnchor, right: numberTextField.trailingAnchor, left: numberTextField.leadingAnchor, paddingTop: 5, height: 45)
        passwordTextfield.layer.borderWidth = 2
        passwordTextfield.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        passwordTextfield.passwordTextField.delegate = self
    }
    
    func setupContinueButton() {
        continueButton.setViewConstraints(top: passwordTextfield.bottomAnchor, right: passwordTextfield.trailingAnchor, left: passwordTextfield.leadingAnchor, paddingTop: 30, height: 45)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.backgroundColor = .mintynDefaultBrownColor
        continueButton.cornerRadius = 10
        continueButton.clipsToBounds = true
        continueButton.addTarget(self, action: #selector(continueButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    @objc func backButtontapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func continueButtonTapped(_ sender: UIButton) {
        checkTextfields()
    }
    
    func checkTextfields() {
        if let bvnText = bvnTextfield.textfield.text, !bvnText.isEmpty {
            print("BVN is: \(bvnText)")
            defaultBVN()
            if let numberText = numberTextField.numberTextField.text, !numberText.isEmpty {
                print("Phone Number is: \(numberText)")
                defaultNumber()
                if let passwordText = passwordTextfield.passwordTextField.text, !passwordText.isEmpty {
                    print("Password is: \(passwordText)")
                    defaultPassword()
                } else {
                    passwordLabel.textColor = .red
                    passwordTextfield.layer.borderColor = UIColor.red.cgColor
                }
            }
            else {
                numberLabel.textColor = .red
                numberTextField.layer.borderColor = UIColor.red.cgColor
            }
        } else {
            bvnLabel.textColor = .red
            bvnTextfield.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    func defaultBVN() {
        bvnTextfield.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        bvnLabel.textColor = .black
    }
    
    func defaultNumber() {
        numberTextField.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        numberLabel.textColor = .black
    }
    
    func defaultPassword() {
        passwordTextfield.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        passwordLabel.textColor = .black
    }
}

extension RegisterNewDeviceVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case bvnTextfield.textfield:
            defaultBVN()
        case numberTextField.numberTextField:
            defaultNumber()
        case passwordTextfield.passwordTextField:
            defaultPassword()
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case bvnTextfield.textfield:
            defaultBVN()
        case numberTextField.numberTextField:
            defaultNumber()
        case passwordTextfield.passwordTextField:
            defaultPassword()
        default:
            break
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case numberTextField.numberTextField:
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        default:
            return true
        }
    }
}
