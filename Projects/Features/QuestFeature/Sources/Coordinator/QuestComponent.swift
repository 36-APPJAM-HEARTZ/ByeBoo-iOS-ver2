//
//  QuestComponent.swift
//  QuestFeature
//
//  Created by 최주리 on 6/18/26.
//

import UIKit

import NeedleFoundation

import QuestFeatureInterface

public protocol QuestDependency: Dependency {
    
}

@MainActor
public final class QuestComponent: Component<QuestDependency> {
    public func questViewController(coordinator: QuestCoordinatorProtocol) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        return vc
    }
}
