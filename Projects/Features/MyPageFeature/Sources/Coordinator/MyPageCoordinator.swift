//
//  MyPageCoordinator.swift
//  MyPageFeature
//
//  Created by 최주리 on 6/18/26.
//

import UIKit

import PresentationKit
import MyPageFeatureInterface

public final class MyPageCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    public var finished: (() -> Void)?
    
    private let navigationController: UINavigationController
    private let component: MyPageComponent
    
    
    public init(
        navigationController: UINavigationController,
        component: MyPageComponent
    ) {
        self.navigationController = navigationController
        self.component = component
    }
    public func start() {
        showMypage()
    }
}

extension MyPageCoordinator: MyPageCoordinatorProtocol {
    public func showMypage() {
        let vc = component.myPageViewController(coordinator: self)
        navigationController.setViewControllers([vc], animated: false)
    }
}
