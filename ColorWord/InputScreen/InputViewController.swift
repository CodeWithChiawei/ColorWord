//
//  ThirdViewController.swift
//  ColorWord
//
//  Created by chiawei wen on 3/3/23.
//


import Foundation
import UIKit

protocol ReturnButtonViewControllerDelegate {
    func textInputVCBackButtonTapped(text: String)
}

class InputViewController: UIViewController {
    
    let contentView = InputView()
    var delegate: ReturnButtonViewControllerDelegate?
    var storedText: String?

    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetup()
        
        guard let text = storedText else { return }
        contentView.configureTextfield(with: text)
    }
    
    private func navigationSetup() {
        title = "Third"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back", style: .plain,
            target: self, action: #selector(leftBarButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.backgroundColor = .systemPink
    }
    
    @objc
    private func leftBarButtonTapped() {
        delegate?.textInputVCBackButtonTapped(text: contentView.textField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}
