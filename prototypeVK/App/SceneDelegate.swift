//
//  SceneDelegate.swift
//  prototypeVK
//
//  Created by Max Polinkovsky on 18.01.2021.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var mainVC = UIViewController()
    var window: UIWindow?
    
    
    //    MARK: Singletone https://stackoverflow.com/questions/56588843/uiapplication-shared-delegate-equivalent-for-scenedelegate-xcode11
    static func shared() -> SceneDelegate {
        let scene = UIApplication.shared.connectedScenes.first
        let sceneDelegate: SceneDelegate = ((scene?.delegate as? SceneDelegate)!)
        return sceneDelegate
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
      
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        mainVC = PageSwipeController(collectionViewLayout: layout) //до отключения Intro по логину
        window?.rootViewController = PageSwipeController(collectionViewLayout: layout)
        window?.makeKeyAndVisible()
    }
    
   
    //    MARK: Protocol AuthServiceVKDelegate
    func authServiceShouldShow(_ viewController: UIViewController) {
        if let _ = defaults.object(forKey: "vkSign") {
            mainVC = LoginVC()
            mainVC.present(viewController, animated: true)
        }
        print(#function)
    }
    
    func authServiceSignIn() {
        print(#function)
    }
    
    func authServiceDidSignInFail() {
        print(#function)
    }
    
    
}

