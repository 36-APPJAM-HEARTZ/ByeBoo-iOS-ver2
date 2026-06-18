//
//  HomeCoordinator.swift
//  HomeFeature
//
//  Created by 최주리 on 6/18/26.
//

import UIKit

import PresentationKit
import HomeFeatureInterface

public final class HomeCoordinator: Coordinator {
    public var childCoordinators: [any PresentationKit.Coordinator] = []
    public var finished: (() -> Void)?
    
    private let navigationController: UINavigationController
    private let component: HomeComponent
    
    public init(
        navigationController: UINavigationController,
        component: HomeComponent
    ) {
        self.navigationController = navigationController
        self.component = component
    }
    
    public func start() {
        showHome()
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    public func showHome() {
        let vc = component.homeViewController(coordinator: self)
        navigationController.setViewControllers([vc], animated: false)
    }
}
