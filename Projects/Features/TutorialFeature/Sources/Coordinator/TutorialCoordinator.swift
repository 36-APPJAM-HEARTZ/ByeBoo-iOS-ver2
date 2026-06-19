//
//  TutorialCoordinator.swift
//  TutorialFeature
//
//  Created by 최주리 on 6/19/26.
//

import UIKit

import PresentationKit
import TutorialFeatureInterface

public final class TutorialCoordinator: Coordinator {
    public var childCoordinators: [any PresentationKit.Coordinator] = []
    public var finished: (() -> Void)?
    
    private let navigationController: UINavigationController
    private let component: TutorialComponent
    
    public init(
        navigationController: UINavigationController,
        component: TutorialComponent
    ) {
        self.navigationController = navigationController
        self.component = component
    }
    
    public func start() {
        showTutorial()
    }
}

extension TutorialCoordinator: TutorialCoordinatorProtocol {
    public func showTutorial() {
        let vc = component.tutorialViewController(coordinator: self)
        navigationController.present(vc, animated: false)
    }
}
