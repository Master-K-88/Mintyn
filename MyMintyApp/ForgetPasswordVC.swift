//
//  ForgetPasswordVC.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 10/12/2022.
//

import UIKit

class ForgetPasswordVC: UIViewController {
    
    lazy var backButton = UIButton()
    lazy var forgetPasswordTitle = CustomLabel(text: MintynText.forgetPassword.text, font: .systemFont(ofSize: 18, weight: .bold))
    
    lazy var forgetPasswordIconBGView = UIView()
    lazy var forgetViewIcon = CustomImageView(image: UIImage(systemName: "lock") ?? UIImage())
    lazy var forgetInfoLabel = CustomLabel(text: MintynText.forgetPasswordInfo.text, font: .systemFont(ofSize: 12, weight: .regular))
    
    lazy var bvnLabel = CustomLabel(text: "BVN")
    lazy var bvnTextfield = MintynTextField()
    
    lazy var numberLabel = CustomLabel(text: MintynText.phoneNumber.text)
    lazy var numberTextField = MintynNumberTextField()
    
    lazy var continueButton = CustomButton(text: MintynText.continueText.text, font: .systemFont(ofSize: 16, weight: .semibold))
    
    lazy var issuesLabel = CustomLabel(text: "Having issues?", font: .systemFont(ofSize: 16, weight: .semibold))
    lazy var contactSupportButton = CustomButton(text: "Contact Support", font: .systemFont(ofSize: 16, weight: .bold))
    
    lazy var contactSupportStack = CustomStackView(views: [issuesLabel, contactSupportButton], distribution: .fillProportionally, spacing: 2)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        [
            backButton, forgetPasswordTitle, forgetPasswordIconBGView,
            bvnLabel, bvnTextfield, numberLabel, numberTextField,
            continueButton, contactSupportStack
        ].forEach { newView in
            view.addSubview(newView)
        }
        setupConstraints()
        
    }
    
    func setupConstraints() {
        setupBackButton()
        setupTitle()
        setupForgetPasswordIconBGView()
        
        setupBVNLabel()
        setupBVNTextfield()
        
        setupNumberLabel()
        setupNumberTextfield()
        
        setupContinueButton()
        
        setupContactSupportButton()
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
        forgetPasswordTitle.setViewConstraints(top: backButton.topAnchor, paddingTop: 5)
        forgetPasswordTitle.setCenterAnchor(horizontal: view.centerXAnchor)
    }
    
    func setupForgetPasswordIconBGView() {
        forgetPasswordIconBGView.addSubview(forgetViewIcon)
        
        forgetPasswordIconBGView.setViewConstraints(top: forgetPasswordTitle.bottomAnchor, paddingTop: 50, width: 150, height: 150)
        forgetPasswordIconBGView.cornerRadius = 75
        forgetPasswordIconBGView.clipsToBounds = true
        
        forgetPasswordIconBGView.setCenterAnchor(horizontal: view.centerXAnchor)
        forgetPasswordIconBGView.backgroundColor = .mintynLightBrownColor.withAlphaComponent(0.2)
        setupForgetPasswordIcon()
    }
    
    func setupForgetPasswordIcon() {
        forgetViewIcon.setCenterAnchor(vertical: forgetPasswordIconBGView.centerYAnchor, horizontal: forgetPasswordIconBGView.centerXAnchor)
        forgetViewIcon.setSize(width: 75, height: 75)
        forgetViewIcon.tintColor = .mintynDefaultBrownColor
    }
    
    func setupBVNLabel() {
        bvnLabel.setViewConstraints(top: forgetPasswordIconBGView.bottomAnchor, left: view.leadingAnchor, paddingTop: 30, paddingLeft: 20)
    }
    
    func setupBVNTextfield() {
        bvnTextfield.setViewConstraints(top: bvnLabel.bottomAnchor, right: view.trailingAnchor, left: bvnLabel.leadingAnchor, paddingTop: 5, paddingRight: 20, height: 45)
        bvnTextfield.layer.borderWidth = 2
        bvnTextfield.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        bvnTextfield.placeHolder = "Enter your bvn"
        bvnTextfield.textfield.keyboardType = .numberPad
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
    
    func setupContinueButton() {
        continueButton.setViewConstraints(top: numberTextField.bottomAnchor, right: numberTextField.trailingAnchor, left: numberTextField.leadingAnchor, paddingTop: 30, height: 45)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.backgroundColor = .mintynDefaultBrownColor
        continueButton.cornerRadius = 10
        continueButton.clipsToBounds = true
        continueButton.addTarget(self, action: #selector(continueButtonTapped(_:)), for: .touchUpInside)
    }
    
    func setupContactSupportButton() {
        contactSupportStack.setViewConstraints(top: continueButton.bottomAnchor, paddingTop: 35)
        contactSupportStack.setCenterAnchor(horizontal: view.centerXAnchor)
        issuesLabel.textColor = .black
        contactSupportStack.setSize(width: 260)
        contactSupportButton.setSize(width: 140)
        contactSupportButton.setTitleColor(.mintynDefaultBrownColor, for: .normal)
        contactSupportButton.addTarget(self, action: #selector(contactSupportButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    @objc func backButtontapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func continueButtonTapped(_ sender: UIButton) {
        numberTextField.numberTextField.resignFirstResponder()
        bvnTextfield.textfield.resignFirstResponder()
        checkTextfields()
    }
    
    @objc func contactSupportButtonTapped(_ sender: UIButton) {
        let contactSupportVC = ContactSupportVC()
        navigationController?.pushViewController(contactSupportVC, animated: true)
    }
    
    func checkTextfields() {
        if let bvnText = bvnTextfield.textfield.text, !bvnText.isEmpty {
            print("BVN is: \(bvnText)")
            defaultBVN()
            if let numberText = numberTextField.numberTextField.text, !numberText.isEmpty {
                print("Phone Number is: \(numberText)")
                defaultNumber()
            }
            else {
                numberLabel.textColor = .red
                numberTextField.layer.borderColor = UIColor.red.cgColor
                showToast(message: "Phone number is requirred", bgColor: .red, textColor: .white)
            }
        } else {
            bvnLabel.textColor = .red
            bvnTextfield.layer.borderColor = UIColor.red.cgColor
            showToast(message: "BVN is requirred", bgColor: .red, textColor: .white)
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
    
}

extension ForgetPasswordVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case bvnTextfield.textfield:
            defaultBVN()
        case numberTextField.numberTextField:
            defaultNumber()
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
        default:
            break
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case numberTextField.numberTextField, bvnTextfield.textfield:
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        default:
            return true
        }
    }
}
