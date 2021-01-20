//
//  LoginVC.swift
//  prototypeVK
//
//  Created by Max Polinkovsky on 19.01.21.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var vKLoginButton: UIButton!
    
    private var authInVK: AuthServiceVK!
//    MARK: Firebase - для пробы
    private var authInFirebase: AuthServiceFirebase!
    override func viewDidLoad() {
        super.viewDidLoad()
//        authInVK = AuthServiceVK()
        authInVK = SceneDelegate.shared().authService
        authInFirebase = AuthServiceFirebase()
        
        setupUI()
        emailTF.text = ""
        passTF.text = ""
    }
    
    fileprivate func setupUI() {
        registerButton.clipsToBounds = true
        registerButton.layer.cornerRadius = 12
        registerButton.backgroundColor = .azure
        vKLoginButton.clipsToBounds = true
        vKLoginButton.layer.cornerRadius = 12
        vKLoginButton.backgroundColor = .azure
    }

    @IBAction func registerFBUser(_ sender: UIButton) {
        guard let email = emailTF.text, let pass = passTF.text else {return}
        authInFirebase.signInFirebase(email: email, password: pass)
    }
//    MARK: --Почему нельзя так привязаться для передачи по ключу? SceneDelegate, 63 строка
    @IBAction func vKAuthClick(_ sender: UIButton) {
        guard let _ = defaults.object(forKey: "vkSign") as? String else { return }
        authInVK.wakeUpSession()
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
