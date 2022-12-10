//
//  MintynTextField.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 10/12/2022.
//

import UIKit

class MintynTextField: UIView {
    
    public lazy var textfield = UITextField()
    public lazy var placeHolder: String = "" {
        didSet {
            textfield.placeholder = placeHolder
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white.withAlphaComponent(0.8)
        [textfield].forEach { newView in
            addSubview(newView)
        }
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius = bounds.height * 0.25
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        setupTextField()
    }
    
    func setupTextField() {
        textfield.setViewConstraints(top: topAnchor, right: trailingAnchor, bottom: bottomAnchor, left: leadingAnchor, paddingLeft: 10, paddingRight: 5)
        
    }
    
}
