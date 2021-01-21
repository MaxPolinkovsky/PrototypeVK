//
//  SceneDelegate.swift
//  prototypeVK
//
//  Created by Max Polinkovsky on 18.01.2021.
//

import UIKit
import VK_ios_sdk

class SceneDelegate: UIResponder, UIWindowSceneDelegate, AuthServiceVKDelegate {
    
    var mainVC = UIViewController()
    var window: UIWindow?
    var authService: AuthServiceVK!
    
    //    MARK: Singletone https://stackoverflow.com/questions/56588843/uiapplication-shared-delegate-equivalent-for-scenedelegate-xcode11
    static func shared() -> SceneDelegate {
        let scene = UIApplication.shared.connectedScenes.first
        let sceneDelegate: SceneDelegate = ((scene?.delegate as? SceneDelegate)!)
        return sceneDelegate
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        }
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.authService = AuthServiceVK()
        authService.delegate = self //присваиваем делегат
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        mainVC = PageSwipeController(collectionViewLayout: layout) //до отключения Intro по логину
        window?.rootViewController = PageSwipeController(collectionViewLayout: layout)
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
       
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
       
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
      
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
  
    }

    //    MARK: Protocol AuthServiceVKDelegate
    func authServiceShouldShow(_ viewController: UIViewController) {
       
            mainVC = LoginVC()
            mainVC.present(viewController, animated: true)
        print(#function)
    }
    
    func authServiceSignIn() {
        print(#function)
    }
    
    func authServiceDidSignInFail() {
        print(#function)
    }
    
    
}

