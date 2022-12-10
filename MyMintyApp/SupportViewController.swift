//
//  SupportViewController.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 10/12/2022.
//

import UIKit

class SupportViewController: UIViewController {
    
    lazy var backgroundImage = CustomImageView(image: UIImage(named: "bgImage") ?? UIImage())
    lazy var navView = UIView()
    lazy var closeButton = CustomButton(text: "Close", font: .systemFont(ofSize: 18, weight: .regular))
    lazy var titleLabel = CustomLabel(text: "Inbox", font: .systemFont(ofSize: 18, weight: .semibold))
    lazy var titleInfoLabel = CustomLabel(text: "We are away now")
    
    lazy var fromMessage = MintynMessageView()
    lazy var messageTextField = MintynmessageTextField()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewMode()
        fromMessage.isHidden = true
        [backgroundImage, navView, fromMessage, messageTextField].forEach { newView in
            view.addSubview(newView)
        }
        
        setupUIViews()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1) {
                self.fromMessage.isHidden = false
            }
        }
    }
    
    func setupUIViews() {
        setupBackgroundImageView()
        setupCustomNavBar()
        setupFromMessage()
        setupMessageTextField()
        
    }
    
    func setupBackgroundImageView() {
        backgroundImage.pin(to: view)
    }
    
    func setupCustomNavBar() {
        navView.setViewConstraints(top: view.topAnchor, right: view.trailingAnchor, left: view.leadingAnchor, height: 90)
        [closeButton, titleLabel, titleInfoLabel].forEach { newView in
            navView.addSubview(newView)
        }
        
        navView.backgroundColor = .white
        
        setupCloseButton()
        setupTitleLabel()
        setupTitleInfoLabel()
        
    }
    
    func setupCloseButton() {
        closeButton.setViewConstraints(bottom: navView.bottomAnchor, left: view.leadingAnchor, paddingLeft: 20, paddingBottom: 10, width: 70, height: 30)
        closeButton.setTitleColor(.link, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
    }
    
    func setupTitleLabel() {
        titleLabel.setViewConstraints(bottom: navView.bottomAnchor, paddingBottom: 20)
        titleLabel.setCenterAnchor(horizontal: navView.centerXAnchor)
    }
    
    func setupTitleInfoLabel() {
        titleInfoLabel.setViewConstraints(top: titleLabel.bottomAnchor, paddingTop: 0)
        titleInfoLabel.setCenterAnchor(horizontal: navView.centerXAnchor)
        titleInfoLabel.textColor = .lightGray
    }
    
    func setupFromMessage() {
        fromMessage.setViewConstraints(top: navView.bottomAnchor, right: view.trailingAnchor, left: view.leadingAnchor, paddingTop: 10, paddingLeft: 5, paddingRight: 30)
        fromMessage.image = "mintyn_circle_logo"
        fromMessage.fromPersonMessage.text = "Hello there! Need help? Reach out to us right here, and we'll get back to you as soon as we can!"
        
    }
    
    func setupMessageTextField() {
//        messageTextField.setViewConstraints(right: view.trailingAnchor, bottom: view.bottomAnchor, left: view.leadingAnchor, height: 60)
        messageTextField.frame = CGRect(x: 0, y: view.bounds.height - 70, width: view.bounds.width, height: 50)
        messageTextField.backgroundColor = .white
    }
    
    
    
    @objc func closeButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
