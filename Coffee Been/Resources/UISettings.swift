//
//  UISettings.swift
//  Coffee Been
//
//  Created by Uladzislau Komar on 15.11.22.
//

import Foundation
import UIKit

enum Colors {
    case green
    case black
    case gray
    case white
    func getColor() -> UIColor {
        switch self {
        case .green:
            return UIColor(red: 15/255, green: 149/255, blue: 101/255, alpha: 1)
        case .black:
            return UIColor(red: 19/255, green: 19/255, blue: 19/255, alpha: 1)
        case .gray:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        case .white:
            return UIColor.white
        }
    }
}

func getButton(text: String, bgColor: Colors, textColor: Colors, height: Int, border: Bool) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.setTitleColor(textColor.getColor(), for: .normal)
    button.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
    button.layer.cornerRadius = 15
    button.layer.borderWidth = border ? 1 : 0
    button.layer.borderColor = border ? UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor : UIColor.clear.cgColor
    button.backgroundColor = bgColor.getColor()
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    button.setTitleColor(.gray, for: .highlighted)
    return button
}

func getTextField(placeholder: String, height: Int, secureField: Bool = false) -> UITextField {
    let textField = UITextField()
    textField.layer.borderWidth = 1
    textField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
    textField.layer.cornerRadius = 15
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
    textField.placeholder = "Enter your password"
    textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 3))
    textField.leftViewMode = .always
    textField.isSecureTextEntry = secureField
    return textField
}

func getLogoStack(textSize: Int) -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    
    let leftSide = "Coffee "
    let rightSide = "Been"
    
    let leftLabel = UILabel()
    let rightLabel = UILabel()
    
    leftLabel.text = leftSide
    rightLabel.text = rightSide
    
    let boldFont = CGFloat(textSize)
    leftLabel.font = UIFont.systemFont(ofSize: boldFont, weight: .heavy)
    rightLabel.font = UIFont.systemFont(ofSize: boldFont, weight: .heavy)
    
    leftLabel.textColor = Colors.black.getColor()
    rightLabel.textColor = Colors.green.getColor()
    
    stackView.addArrangedSubview(leftLabel)
    stackView.addArrangedSubview(rightLabel)
    return stackView
}

func getLabelForTextField(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    label.font = UIFont.systemFont(ofSize: 14)
    return label
}
