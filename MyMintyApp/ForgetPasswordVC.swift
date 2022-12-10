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
    
    lazy var forgetViewIcon = CustomImageView(image: UIImage(systemName: "lock") ?? UIImage())
    lazy var forgetInfoLabel = CustomLabel(text: MintynText.forgetPasswordInfo.text, font: .systemFont(ofSize: 12, weight: .regular))
    
    lazy var bvnLabel = CustomLabel(text: "BVN")
    lazy var bvnTextfield = MintynTextField()
    
    lazy var numberLabel = CustomLabel(text: MintynText.phoneNumber.text)
    lazy var numberTextField = MintynNumberTextField()
    
    lazy var continueButton = CustomButton(text: MintynText.continueText.text, font: .systemFont(ofSize: 16, weight: .semibold))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
