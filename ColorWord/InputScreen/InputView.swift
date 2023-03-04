//
//  TextInputView.swift
//  WordWithFun
//
//  Created by chiawei wen on 3/3/23.
//

import Foundation
import UIKit

class InputView: UIView {
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Enter Text Here"
        textField.borderStyle = .bezel
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraint() {
        addSubview(textField)
        
        textField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    func configureTextfield(with text: String) {
        textField.text = text
    }
}
