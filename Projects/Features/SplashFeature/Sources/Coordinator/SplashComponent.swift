//
//  SplashComponent.swift
//  SplashFeature
//
//  Created by 최주리 on 6/15/26.
//

import UIKit

import NeedleFoundation

import DomainInterface

public protocol SplashDependency: Dependency {
    var blockUserUseCase: BlockUserUseCase { get }
}

public final class SplashComponent: Component<SplashDependency> {
    public func splashViewController(coordinator: SplashCoordinator) -> UIViewController {
        let viewModel = SplashViewModel(
            coordinatr: coordinator,
            blockUserUseCase: dependency.blockUserUseCase
        )
        
        return SplashViewController(viewModel: viewModel)
    }
}
