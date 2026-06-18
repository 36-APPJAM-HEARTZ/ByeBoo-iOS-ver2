//
//  QuestCoordinator.swift
//  QuestFeature
//
//  Created by 최주리 on 6/18/26.
//

import UIKit

import PresentationKit
import QuestFeatureInterface

public final class QuestCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    public var finished: (() -> Void)?
    
    private let navigationController: UINavigationController
    private let component: QuestComponent
    
    
    public init(
        navigationController: UINavigationController,
        component: QuestComponent
    ) {
        self.navigationController = navigationController
        self.component = component
    }
    public func start() {
        showQuestMain()
    }
}

extension QuestCoordinator: QuestCoordinatorProtocol {
    public func showQuestMain() {
        let vc = component.questViewController(coordinator: self)
        navigationController.setViewControllers([vc], animated: false)
    }
}
