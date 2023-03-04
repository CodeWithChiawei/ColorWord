//
//  SecondView.swift
//  ColorWord
//
//  Created by chiawei wen on 3/3/23.
//

import Foundation
import UIKit

class ButtonView: UIView {
    
    let circleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 75
        return button
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
        addSubview(circleButton)
        
        circleButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circleButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        circleButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        circleButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func changeCircleButtonColor(with text: String) {
        if !text.isEmpty {
            circleButton.backgroundColor = .yellow
        } else {
            circleButton.backgroundColor = .white
        }
    }
}
