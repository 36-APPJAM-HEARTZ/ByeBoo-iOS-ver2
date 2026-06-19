//
//  MainTabCoordinator.swift
//  MainTabFeature
//
//  Created by 최주리 on 6/17/26.
//

import UIKit

import NeedleFoundation

import PresentationKit
import MainTabFeatureInterface

import HomeFeature
import QuestFeature
import MyPageFeature
import TutorialFeature

public final class MainTabCoordinator: Coordinator {
    public var childCoordinators: [any Coordinator] = []
    public var finished: (() -> Void)?
    
    private let tabBarController: UITabBarController
    private let component: MainTabComponent
    
    private let homeNav = UINavigationController()
    private let questNav = UINavigationController()
    private let mypageNav = UINavigationController()
    
    public init(
        tabBarController: UITabBarController,
        component: MainTabComponent
    ) {
        self.tabBarController = tabBarController
        self.component = component
    }
    
    public func start() {
        showTabBar()
    }
}

extension MainTabCoordinator: MainTabCoordinatorProtocol {
    
    public func showTabBar() {
        setHomeNav()
        setQuestNav()
        setMypageNav()
        
        tabBarController.setViewControllers([homeNav, questNav, mypageNav], animated: false)
    }
    
    public func showTutorial() {
        guard let navigationController = tabBarController.selectedViewController as? UINavigationController else { return }
        
        let coordinator = TutorialCoordinator(
            navigationController: navigationController,
            component: component.tutorialComponent
        )
        
        add(child: coordinator)
        
        coordinator.finished = { [weak self] in
            self?.remove(child: coordinator)
        }
        
        coordinator.start()
    }
    
    public func switchTab(to tab: MainTab) {
        guard let viewControllers = tabBarController.viewControllers,
              viewControllers.indices.contains(tab.rawValue) else { return }
        
        tabBarController.selectedIndex = tab.rawValue
    }
    
    private func setHomeNav() {
        let homeCoordinator = HomeCoordinator(
            navigationController: homeNav,
            component: component.homeComponent
        )
        homeNav.tabBarItem = UITabBarItem(title: "홈", image: .homeOff, tag: 0)
        
        homeCoordinator.finished = { [weak self] in
            self?.finished?()
        }
        
        homeCoordinator.showTutorialHandler = { [weak self] in
            self?.showTutorial()
        }
        
        homeCoordinator.showQuestTabHandler = { [weak self] in
            self?.switchTab(to: .quest)
        }
        
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
    
    private func setQuestNav() {
        let questCoordinator = QuestCoordinator(
            navigationController: questNav,
            component: component.questComponent
        )
        questNav.tabBarItem = UITabBarItem(title: "퀘스트", image: .questOff, tag: 1)
        childCoordinators.append(questCoordinator)
        
        questCoordinator.finished = { [weak self] in
            self?.finished?()
        }
        
        questCoordinator.start()
    }
    
    private func setMypageNav() {
        let mypageCoordinator = MyPageCoordinator(
            navigationController: mypageNav,
            component: component.mypageComponent
        )
        mypageNav.tabBarItem = UITabBarItem(title: "내 정보", image: .userOff, tag: 2)
        childCoordinators.append(mypageCoordinator)
        
        mypageCoordinator.finished = { [weak self] in
            self?.finished?()
        }
        
        mypageCoordinator.start()
    }
    
    
}
