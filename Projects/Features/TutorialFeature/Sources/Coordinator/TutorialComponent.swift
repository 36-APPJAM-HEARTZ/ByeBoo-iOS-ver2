//
//  TutorialComponent.swift
//  TutorialFeature
//
//  Created by 최주리 on 6/19/26.
//

import UIKit

import NeedleFoundation

import TutorialFeatureInterface

public protocol TutorialDependency: Dependency {
    
}

@MainActor
public final class TutorialComponent: Component<TutorialDependency> {
    public func tutorialViewController(coordinator: TutorialCoordinatorProtocol) -> UIViewController {
        return TutorialModalViewController(coordinator: coordinator)
    }
}
