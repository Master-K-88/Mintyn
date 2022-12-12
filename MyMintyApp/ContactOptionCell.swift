//
//  ContactOptionCell.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 12/12/2022.
//

import UIKit
import SwiftUI

enum ContactOptions {
    case whatsapp, facebook, twitter, reset
}

extension ContactOptions {
    
    var text: String {
        switch self {
        case .whatsapp:
            return "Whatsapp"
        case .facebook:
            return "Facebook"
        case .twitter:
            return "Twitter"
        case .reset:
            return "Reset Security Detail"
        }
    }
    var images: UIImage {
        switch self {
        case .whatsapp:
            return UIImage(named: "Whatsapp") ?? UIImage()
        case .facebook:
            return UIImage(named: "Facebook") ?? UIImage()
        case .twitter:
            return UIImage(named: "Twitter") ?? UIImage()
        case .reset:
            return UIImage(named: "Reset") ?? UIImage()
        }
    }
}

class ContactOptionCell: UITableViewCell {
    
    static let identifier = "ContactOptionCell"
    
    var contactOption: ContactOptions = .whatsapp {
        didSet {
            optionImageView.image = contactOption.images
            optionLabel.text = contactOption.text
            dividerLine.isHidden = contactOption != .reset
        }
    }
    
    lazy var optionImageView = CustomImageView(image: ContactOptions.reset.images)
    lazy var optionLabel = CustomLabel(text: "Whatsapp", font: .systemFont(ofSize: 14, weight: .regular))
    lazy var optionButtonImage = CustomImageView(image: UIImage(systemName: "chevron.right") ?? UIImage())
    lazy var dividerLine = UIView.bgView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIs()
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUIs() {
        [optionImageView, optionLabel, optionButtonImage, dividerLine].forEach { newView in
            addSubview(newView)
        }
        
        
    }
    
    func setupLayout() {
        setupConstraints()
    }
    
    func setupConstraints() {
        setupOptiionImageView()
        setupOptionLabel()
        setupOptionButtonImage()
        setupDividerLine()
    }
    
    func setupOptiionImageView() {
        optionImageView.setViewConstraints(left: leadingAnchor, paddingLeft: 20, width: 40, height: 40)
        optionImageView.setCenterAnchor(vertical: centerYAnchor)
        optionImageView.cornerRadius = 25
        optionImageView.clipsToBounds = true
        optionImageView.tintColor = contactOption != .reset ? .darkGray : .lightGray
    }
    
    func setupOptionLabel() {
        optionLabel.setViewConstraints(left: optionImageView.trailingAnchor, paddingLeft: 25)
        optionLabel.setCenterAnchor(vertical: centerYAnchor)
    }
    
    
    func setupOptionButtonImage() {
        optionButtonImage.setViewConstraints(right: trailingAnchor, paddingRight: 20, width: 15, height: 20)
        optionButtonImage.setCenterAnchor(vertical: centerYAnchor)
        optionButtonImage.tintColor = .gray
    }
    
    func setupDividerLine() {
        dividerLine.setViewConstraints(top: topAnchor, right: trailingAnchor, left: leadingAnchor, height: 2)
        dividerLine.backgroundColor = .lightGray
    }
}
