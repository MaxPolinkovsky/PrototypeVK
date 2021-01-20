//
//  AlertVC.swift
//  prototypeVK
//
//  Created by Max Polinkovsky on 19.01.21.
//

import UIKit

class AlertVC: UIViewController {
    func errorAlert() {
        let alert = UIAlertController(title: "Login or Pass is empty",
                                      message: "Fill all fields.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}


