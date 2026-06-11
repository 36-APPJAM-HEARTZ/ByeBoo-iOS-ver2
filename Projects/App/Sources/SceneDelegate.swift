//
//  SceneDelegate.swift
//  ByeBoo
//
//  Created by 최주리 on 6/9/26.
//

import UIKit

import DesignSystem

import SplashFeature

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        DesignSystemFontFamily.registerAllCustomFonts()
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = SplashFeatureViewController()
        window?.makeKeyAndVisible()
    }
}
