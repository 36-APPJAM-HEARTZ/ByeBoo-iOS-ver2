//
//  ByeBooTabBar.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 7/5/25.
//

import UIKit

import DesignSystem

public final class ByeBooTabBar: UITabBarController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .grayscale900
        
        setValue(ByeBooTabBarView(), forKey: "tabBar")
        setViewControllerAppearance()
    }
    
    private func setViewControllerAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .grayscale900
        appearance.shadowColor = .grayscale800
        
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = .grayscale400
        itemAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4.adjustedH)
        itemAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.grayscale400,
            .font: FontManager.body6R14.font
        ]
        
        itemAppearance.selected.iconColor = .primary300
        itemAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4.adjustedH)
        itemAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.primary300,
            .font: FontManager.body6R14.font
        ]
        
        appearance.stackedLayoutAppearance = itemAppearance
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}

