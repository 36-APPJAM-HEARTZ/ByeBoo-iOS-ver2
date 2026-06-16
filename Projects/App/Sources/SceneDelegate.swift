//
//  SceneDelegate.swift
//  ByeBoo
//
//  Created by 최주리 on 6/9/26.
//

import UIKit

import DesignSystem
import PresentationKit

import SplashFeature

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var coordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        DesignSystemFontFamily.registerAllCustomFonts()
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        self.window = window
        
        let appComponent = AppComponent()
        
        coordinator = AppCoordinator(window: window, dependency: appComponent)
        coordinator?.start()
        
    }
}
