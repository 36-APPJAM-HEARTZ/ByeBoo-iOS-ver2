//
//  MyPageComponent.swift
//  MyPageFeature
//
//  Created by 최주리 on 6/18/26.
//

import UIKit

import NeedleFoundation

import MyPageFeatureInterface

public protocol MyPageDependency: Dependency {
    
}

@MainActor
public final class MyPageComponent: Component<MyPageDependency> {
    public func myPageViewController(coordinator: MyPageCoordinatorProtocol) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .green
        return vc
    }
}
