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
    var autoLoginUseCase: AutoLoginUseCase { get }
}

@MainActor
public final class SplashComponent: Component<SplashDependency> {
    public func splashViewController(coordinator: SplashCoordinator) -> UIViewController {
        let viewModel = SplashViewModel(autoLoginUseCase: dependency.autoLoginUseCase)
        
        return SplashViewController(viewModel: viewModel, coordinator: coordinator)
    }
    
    public func loginViewController(coordinator: SplashCoordinator) -> UIViewController {
        let viewModel = LoginViewModel()
        return LoginViewController(viewModel: viewModel)
    }
}
