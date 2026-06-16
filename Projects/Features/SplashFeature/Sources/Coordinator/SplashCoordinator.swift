//
//  SplashCoordinator.swift
//  SplashFeature
//
//  Created by 최주리 on 6/16/26.
//

import UIKit

import PresentationKit
import SplashFeatureInterface

public final class SplashCoordinator: Coordinator {
    public var childCoordinators: [any Coordinator] = []
    public var finished: (() -> Void)?
    
    private let navigationController: UINavigationController
    private let component: SplashComponent
    
    public init(
        navigationController: UINavigationController,
        component: SplashComponent
    ) {
        self.navigationController = navigationController
        self.component = component
    }
    
    public func start() {
        showSplash()
    }
}

extension SplashCoordinator: SplashCoordinatorProtocol {
    public func showSplash() {
        let vc = component.splashViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }
    
    public func showLogin() {
        let vc = component.loginViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }
}
