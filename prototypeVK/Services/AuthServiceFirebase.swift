//
//  AuthServiceFirebase.swift
//  prototypeVK
//
//  Created by Max Polinkovsky on 19.01.21.
//

import UIKit
import Firebase

final class AuthServiceFirebase {
    
    let alert = AlertVC()
    
    func signInFirebase(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed:
                    self.alert.errorAlert()
                case .userDisabled:
                    print("Error: The user account has been disabled by an administrator.")
                case .wrongPassword:
                    self.alert.errorAlert()
                case .invalidEmail:
                    self.alert.errorAlert()
                default:
                    self.alert.errorAlert()
                    print("Error: \(error.localizedDescription)")
                }
            } else {
                print("User signs in successfully")
                let userInfo = Auth.auth().currentUser
                _ = userInfo?.email
            }
        }
    }
}


    

