//
//  FirstViewController.swift
//  ColorWord
//
//  Created by chiawei wen on 3/3/23.
//

import Foundation
import UIKit

class LabelViewController : UIViewController {
    
    private let contentView = LabelView()
    var storedText: String = ""
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.button.addTarget(self, action: #selector(nextScreenButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func nextScreenButtonTapped() {
        let secondViewController = ButtonViewController()
        let secondViewControllerNav = UINavigationController(rootViewController: secondViewController)
        
        if !self.storedText.isEmpty {
            secondViewController.isReturned = true
            secondViewController.storedText = self.storedText
        } else {
            secondViewController.isReturned = false
        }
        
        secondViewController.delegate = self
        secondViewControllerNav.modalPresentationStyle = .fullScreen
        present(secondViewControllerNav, animated: true)
    }
}

extension LabelViewController: ReturnLabelViewControllerDelegate {
    func backButtonTapped(text: String) {
        storedText = text
        contentView.label.text = storedText
    }
}
