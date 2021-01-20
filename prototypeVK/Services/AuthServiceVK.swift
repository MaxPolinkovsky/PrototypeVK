//
//  AuthService.swift
//  prototypeVK
//
//  Created by Max Polinkovsky on 19.01.21.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceVKDelegate {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceDidSignInFail()
}

final class AuthServiceVK: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appID = "7733302"
    private let vkSdk: VKSdk
    
    var delegate: AuthServiceVKDelegate?
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appID)
        super.init()
        print("VKSdk.initialize")
//        MARK: - Subscription VKProtocols
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeUpSession() {
        let scope = ["offline"]//список прав доступа
        
        //извлекаем токен из хранилища и проверяем разрешения на использование токена пользователем
        VKSdk.wakeUpSession(scope) { (state, error) in
            if state == VKAuthorizationState.authorized {
                self.delegate?.authServiceSignIn()
                print("VKAuthorizationState.authorized")
            } else if state == VKAuthorizationState.initialized {
                print("VKAuthorizationState.initialized")
                VKSdk.authorize(scope)
            } else {
                print("error: \(String(describing: error)), state: \(state)")
                self.delegate?.authServiceDidSignInFail()
            }
        }
    }
    
    //    MARK: - VKSDK Delegate
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        self.delegate?.authServiceSignIn()
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    //    MARK: - VKSDK UIDelegate
    func vkSdkShouldPresent(_ controller: UIViewController!) { //авторизационная страница в VK
        self.delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
