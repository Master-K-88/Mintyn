//
//  MintynExtensions.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 09/12/2022.
//

import UIKit
enum MintynText {
    case welcomeText
    case moreInfo
    case versionInfo
    case createAcoountTitle
    case createAccountInfo
    case phoneNumber
    case passwordText
    case loginTitle
    case forgetPasswordInfo
    case contactSupportTitle
    
    
    // button
    case loginText
    case continueText
    case registerText
    case createAccountText
    case checkButtondescription
    case forgetPassword
    case registerNewDevice
    case poweredByFinex
}

extension MintynText {
    var text: String {
        switch self {
        case .welcomeText:
            return "Welcome to\n Mintyn Digital Bank"
        case .moreInfo:
            return "Get started with the bank that puts you\n in control"
        case .versionInfo:
            return "Mintyn Version 1.2.97"
        case .createAcoountTitle:
            return "Create an account"
        case .createAccountInfo:
            return "Please enter you phone number to\nget started."
        case .phoneNumber:
            return "Phone Number"
        case .loginTitle:
            return "Welcome"
        case .passwordText:
            return "Password"
        case .contactSupportTitle:
            return "Contact Support"
        case .loginText:
            return "Login"
        case .forgetPasswordInfo:
            return "We will send you a password reset code."
        case .continueText:
            return "Continue"
        case .registerText:
            return "Register your business"
        case .createAccountText:
            return "Create Account"
        case .checkButtondescription:
            return "Remember me"
        case .forgetPassword:
            return "Forget password?"
        case .registerNewDevice:
            return "Register new device"
        case .poweredByFinex:
            return "Powered by FINEX MFB"
        }
    }
}

extension UIColor {
    static var mintynLightBrownColor: UIColor {
        return UIColor(red: 177/255, green: 143/255, blue: 72/255, alpha: 0.4)
    }
    
    static var mintynLightBrownColor2: UIColor {
        return UIColor(red: 177/255, green: 143/255, blue: 72/255, alpha: 0.8)
    }
    
    static var mintynDefaultBrownColor: UIColor {
        return UIColor(red: 177/255, green: 143/255, blue: 72/255, alpha: 1.0)
    }
    
    static var mintynMesageBGColor: UIColor {
        return UIColor(red: 219/255, green: 234/255, blue: 253/255, alpha: 1.0)
    }
}

extension UIView {

    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyVerticalGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil, direction: .vertical)
    }


    func applyGradient(colours: [UIColor], locations: [NSNumber]?, direction: NSLayoutConstraint.Axis = .horizontal) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.cornerRadius = 10
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = direction == .horizontal ? CGPoint(x: 0, y: 0.5) : CGPoint(x: 0, y: 0)
        gradient.endPoint = direction == .horizontal ? CGPoint(x: 1, y: 0.5) : CGPoint(x: 0, y: 1.0)
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}
