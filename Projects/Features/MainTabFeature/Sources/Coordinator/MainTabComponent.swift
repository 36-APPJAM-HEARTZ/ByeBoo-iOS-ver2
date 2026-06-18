//
//  MainTabComponent.swift
//  MainTabFeature
//
//  Created by 최주리 on 6/17/26.
//

import UIKit

import NeedleFoundation

import DomainInterface
import HomeFeature
import QuestFeature
import MyPageFeature

public protocol MainTabDependency: Dependency {

}

@MainActor
public final class MainTabComponent: Component<MainTabDependency> {
    public var homeComponent: HomeComponent {
        HomeComponent(parent: self)
    }
    
    public var questComponent: QuestComponent {
        QuestComponent(parent: self)
    }
    
    public var mypageComponent: MyPageComponent {
        MyPageComponent(parent: self)
    }
    
}
