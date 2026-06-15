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
    var viewModel: SplashViewModel {
        return SplashViewModel(blockUserUseCase: dependency.blockUserUseCase)
    }
    
    public var splashViewController: UIViewController {
        return SplashViewController(viewModel: viewModel)
    }
}
