//
//  AppCoordinator.swift
//  ByeBoo
//
//  Created by 최주리 on 6/16/26.
//

import UIKit

import PresentationKit
import SplashFeature
import MainTabFeature

final class AppCoordinator: Coordinator {
    var childCoordinators: [any Coordinator] = []
    private let window: UIWindow
    private let dependency: AppComponent
    
    private let splashNavigationController = UINavigationController()
    private let tabBarController = ByeBooTabBar()
    
    init(
        window: UIWindow,
        dependency: AppComponent
    ) {
        self.window = window
        self.dependency = dependency
    }
    
    func start() {
        showSplash()
    }
}

extension AppCoordinator {
    @MainActor
    func showSplash() {
        let coordinator = SplashCoordinator(
            navigationController: splashNavigationController,
            component: dependency.splashComponent
        )
        
        coordinator.finished = { [weak self] in
            self?.showTabBar()
            
            self?.remove(child: coordinator)
        }
        
        add(child: coordinator)
        
        splashNavigationController.setViewControllers([], animated: false)
        window.rootViewController = splashNavigationController
        window.makeKeyAndVisible()
        
        coordinator.start()
    }
}

extension AppCoordinator {
    @MainActor
    func showTabBar() {
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
