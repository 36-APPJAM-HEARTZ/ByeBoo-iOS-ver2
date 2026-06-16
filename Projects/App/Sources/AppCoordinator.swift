//
//  AppCoordinator.swift
//  ByeBoo
//
//  Created by 최주리 on 6/16/26.
//

import UIKit

import PresentationKit
import SplashFeature

final class AppCoordinator: Coordinator {
    var childCoordinators: [any Coordinator] = []
    private let window: UIWindow
    private let dependency: AppComponent
    
    private let navigationController = UINavigationController()
    private let tabNavigationController = UINavigationController()
    
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
            navigationController: navigationController,
            component: dependency.splashComponent
        )
        
        coordinator.finished = {
            // homeFeature로 전환
        }
        
        add(child: coordinator)
        
        navigationController.setViewControllers([], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        coordinator.start()
    }
}
