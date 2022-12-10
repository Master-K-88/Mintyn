//
//  ViewController.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 07/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var mintynLabel = CustomLabel(text: "MINTYN", font: .systemFont(ofSize: 22, weight: .bold))
    lazy var mintynImageView = CustomImageView(image: UIImage(named: "mintyn_icon") ?? UIImage())
    
    lazy var mintynLoginView = MintynLoginView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setViewMode()
        view.backgroundColor = UIColor.white
        
        setupUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.mintynLoginView.isHidden = false
        }
        
    }


    func setupUI() {
        [mintynLabel, mintynImageView, mintynLoginView].forEach { newView in
            view.addSubview(newView)
        }
        
        setupMintynLabel()
        setupMintynImageView()
        showLoginView()
        
        mintynLoginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        mintynLoginView.createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        
    }
    
    func setupMintynLabel() {
        mintynImageView.setViewConstraints(top: view.topAnchor, paddingTop: 300)
        mintynImageView.setCenterAnchor(horizontal: view.centerXAnchor)
        mintynImageView.setSize(width: 80, height: 160)
    }
    
    func setupMintynImageView() {
        mintynLabel.setViewConstraints(top: mintynImageView.bottomAnchor, paddingTop: 10)
        mintynLabel.setCenterAnchor(horizontal: view.centerXAnchor)
    }
    
    func showLoginView() {
        mintynLoginView.cornerRadius = 30
        mintynLoginView.frame = CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: view.bounds.height * 0.55)
        
        
        
        self.mintynLoginView.backgroundColor = .white
//        mintynLoginView.gl.shadowColor = UIColor.black.cgColor
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1) {
                self.view.backgroundColor = UIColor.white.withAlphaComponent(0.95)
                self.mintynLoginView.frame = CGRect(x: 0, y: self.view.bounds.height * 0.57, width: self.view.bounds.width, height: self.view.bounds.height * 0.55)
                
            }
        }
        
        
        
        
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc func createAccountButtonTapped(_ sender: UIButton) {
        let createAccountVC = CreateAccountView()
        self.navigationController?.pushViewController(createAccountVC, animated: true)
    }
    
    
}

