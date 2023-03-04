//
//  Created by chiawei wen on 3/3/23.
//

import Foundation
import UIKit

protocol ReturnLabelViewControllerDelegate {
    func backButtonTapped(text: String)
}

class ButtonViewController: UIViewController {
    
    private let contentView = ButtonView()
    var storedText: String = ""
    var delegate: ReturnLabelViewControllerDelegate?
    var isReturned: Bool = false
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationControllerSetup()
        
        if isReturned {
            contentView.circleButton.addTarget(self, action: #selector(circleButtonTapped), for: .touchUpInside)
        } else {
            contentView.circleButton.removeTarget(self, action: #selector(circleButtonTapped), for: .touchUpInside)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView.changeCircleButtonColor(with: storedText)
    }
    
    private func navigationControllerSetup() {
        title = "Second"
        navigationController?.navigationBar.backgroundColor = .orange
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back", style: .plain,
            target: self, action: #selector(leftBarButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .green
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Forward", style: .plain,
            target: self, action: #selector(rightBarButtonTapped)
        )
        navigationItem.rightBarButtonItem?.tintColor = .systemPurple
    }
    
    @objc
    private func circleButtonTapped() {
          storedText = ""
      }

    @objc
    private func leftBarButtonTapped() {
        delegate?.backButtonTapped(text: storedText)
        dismiss(animated: true)
    }
    
    @objc
    private func rightBarButtonTapped() {
        let thirdViewController = InputViewController()
        thirdViewController.storedText = self.storedText
        thirdViewController.delegate = self
        navigationController?.pushViewController(thirdViewController, animated: true)
    }
}

extension ButtonViewController: ReturnButtonViewControllerDelegate {
    func textInputVCBackButtonTapped(text: String) {
        storedText = text
    }
}

