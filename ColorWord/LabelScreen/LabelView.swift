//
//  FirstView.swift
//  ColorWord
//
//  Created by chiawei wen on 3/3/23.
//

import Foundation
import UIKit

class LabelView: UIView {
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next Screen", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        return button
    }()
    
     let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
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
        addSubview(button)
        addSubview(label)
        
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 50).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
