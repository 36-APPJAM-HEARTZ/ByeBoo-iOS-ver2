//
//  HomeComponent.swift
//  HomeFeature
//
//  Created by 최주리 on 6/18/26.
//

import UIKit

import NeedleFoundation

import HomeFeatureInterface

public protocol HomeDependency: Dependency {
    
}

@MainActor
public final class HomeComponent: Component<HomeDependency> {
    public func homeViewController(coordinator: HomeCoordinatorProtocol) -> UIViewController {
        let vc = HomeFeatureViewController(coordinator: coordinator)
//        vc.view.backgroundColor = .red
        
        return vc
    }
}


