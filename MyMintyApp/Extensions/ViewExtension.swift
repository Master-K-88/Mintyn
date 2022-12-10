//
//  ViewExtension.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 09/12/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - CGFloat(Double(message.count) * 4), y: self.view.frame.size.height * 0.5, width: CGFloat(message.count * 8), height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 5.0, delay: 0.1, options: .curveEaseOut) {
            toastLabel.alpha = 0.0
        } completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        }
    }
    
    
    func showAlert(title: String, message: String, positive: String, negavite: String? = nil, completion: (() -> Void)? = nil, cancel: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: positive, style: .default, handler: { action in
            if completion != nil {
                completion!()
            }
        }))
        if negavite != nil && !negavite!.isEmpty {
            alert.addAction(UIAlertAction(title: negavite, style: .default, handler: { action in
                if cancel != nil {
                    cancel!()
                }
            }))
        }
        self.present(alert, animated: true)
        return alert
    }
}

extension UICollectionView {
    
    class func genericCollectionView(direction: UICollectionView.ScrollDirection) -> UICollectionView {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        collectionLayout.minimumInteritemSpacing = 10.0
        collectionLayout.minimumLineSpacing = 10.0
        collectionLayout.scrollDirection = direction
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        return collectionView
    }
}

extension UIView {
    
    class func bgView() -> UIView {
        let view = UIView()
        
        return view
    }
    
    class func customShadowView() -> UIView {
        let view = UIView()
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.masksToBounds = false

        return view
    }
}

extension UIView{
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
    
    func setViewConstraints(top: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let right = right {
            self.trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let left = left {
            self.leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func setSize(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func setCenterAnchor(vertical: NSLayoutYAxisAnchor? = nil,
                         horizontal: NSLayoutXAxisAnchor? = nil,
                         height: NSLayoutDimension? = nil,
                         heightMultiplier: CGFloat = 1,
                         width: NSLayoutDimension? = nil,
                         widthMultiplier: CGFloat = 1) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let vertical = vertical {
            self.centerYAnchor.constraint(equalTo: vertical).isActive = true
        }
        if let horizontal = horizontal {
            self.centerXAnchor.constraint(equalTo: horizontal).isActive = true
        }
        if let height = height {
            self.heightAnchor.constraint(equalTo: height, multiplier: heightMultiplier).isActive = true
        }
        if let width = width {
            self.widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier).isActive = true
        }
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.topAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.trailingAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.bottomAnchor
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.leadingAnchor
    }
    
}

extension UILabel {
    
    class func textLabel(fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: fontSize)
        label.numberOfLines = 0
        return label
    }
    
    class func infoLabel(text: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .left
        label.textColor = .label
        label.font = .systemFont(ofSize: fontSize)
        label.numberOfLines = 0
        return label
    }
    
}

extension UINavigationController {
    func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
                                          .foregroundColor: UIColor.black]

        // Customizing our navigation bar
        self.navigationBar.tintColor = .black
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
    }
}

extension UITableView {
    class func genericTableView(cell: AnyClass, identifier: String)  -> UITableView {
        let tableView = UITableView()
        tableView.register(cell, forCellReuseIdentifier: identifier)
//        tableView.rowHeight = 180
        return tableView
    }
}

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String = "", font: UIFont = .systemFont(ofSize: 12)) {
        self.init(frame: .zero)
        
        self.text = text
        self.font = font
        self.numberOfLines = 0
        textColor = .black
    }
}

class CustomImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(image: UIImage) {
        self.init(frame: .zero)
        
        self.image = image
    }
}

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String = "", font: UIFont = .systemFont(ofSize: 12, weight: .semibold)) {
        self.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = font
    }
    
    convenience init(image: UIImage) {
        self.init(frame: .zero)
        self.setImage(image, for: .normal)
    }
}

class CustomStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(views: [UIView]? = nil, axis: NSLayoutConstraint.Axis = .horizontal, mode: UIView.ContentMode = .scaleToFill, distribution: UIStackView.Distribution = .fillEqually, spacing: CGFloat = 10) {
        self.init(frame: .zero)
        self.axis = axis
        self.contentMode = mode
        self.distribution = distribution
        self.spacing = spacing
        if let views = views {
            views.forEach { newView in
                addArrangedSubview(newView)
            }
        }
    }
    
    
}

extension UIViewController {
    func setViewMode() {
        self.overrideUserInterfaceStyle = .light
    }
    
    func setupToolbar(pinTF: UITextView){
            //Create a toolbar
            let bar = UIToolbar()
            
            //Create a done button with an action to trigger our function to dismiss the keyboard
            let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMyKeyboard))
            
            //Create a felxible space item so that we can add it around in toolbar to position our done button
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            //Add the created button items in the toobar
            bar.items = [flexSpace, flexSpace, doneBtn]
            bar.sizeToFit()
            
            //Add the toolbar to our textfield
            pinTF.inputAccessoryView = bar
        }
         
//         @objc func dismissMyKeyboard(){
//             view.endEditing(true)
//         }
    
    func initializeHideKeyboard(){
            //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(
                target: self,
                action: #selector(dismissMyKeyboard))
            
            //Add this tap gesture recognizer to the parent view
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissMyKeyboard(){
            //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
            //In short- Dismiss the active keyboard.
            view.endEditing(true)
        }
}


@IBDesignable class PaddingLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 10.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 10.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
        
    }

    override var intrinsicContentSize: CGSize {
        numberOfLines = 0
        
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
