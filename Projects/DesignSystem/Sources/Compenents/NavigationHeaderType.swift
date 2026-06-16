//
//  NavigationHeaderType.swift
//  DesignSystem
//
//  Created by 최주리 on 6/11/26.
//


import UIKit
import SnapKit

public enum NavigationHeaderType {
    case clear
    case black
}

public enum NavigationBarType: Equatable {
    case back(header: NavigationHeaderType = .clear)
    case backAndMenu(header: NavigationHeaderType = .clear)
    case backAndEdit(header: NavigationHeaderType = .clear)
    case title(String, header: NavigationHeaderType = .clear)
    case close(header: NavigationHeaderType = .clear)
    case titleAndClose(String, header: NavigationHeaderType = .clear)
    case titleAndBack(String, header: NavigationHeaderType = .clear)
    case editAndClose(header: NavigationHeaderType = .clear)
    case confirmAndBack(String, header: NavigationHeaderType = .clear)
    case none(header: NavigationHeaderType = .clear)
}

@MainActor
public struct ByeBooNavigationBar {
    
    public static func makeNavigationBar(
        navigationItem: UINavigationItem,
        navigationController: UINavigationController?,
        // TODO: - coordinator에서 NavigationBarType을 결정하도록 수정하기
        type: NavigationBarType,
        target: AnyObject?,           
        action: Selector? = nil,
        secondAction: Selector? = nil
    ) {
        let barAppearance = makeBasicBarAppearance(type: type)
        
        configureNavigationItem(
            navigationItem: navigationItem,
            target: target,
            type: type,
            action: action,
            secondAction: secondAction
        )
        
        registerBarAppearance(barAppearance, to: navigationController)
    }
    
    public static func replaceHeaderType(
        from navigationController: UINavigationController,
        headerType: NavigationHeaderType
    ) {
        let barAppearance = setBarAppearance(headerType: headerType)
        registerBarAppearance(barAppearance, to: navigationController)
    }
    
    private static func makeBasicBarAppearance(type: NavigationBarType) -> UINavigationBarAppearance {
        let headerType = setHeaderType(barType: type)
        return setBarAppearance(headerType: headerType)
    }
    
    private static func setHeaderType(barType: NavigationBarType) -> NavigationHeaderType {
        switch barType {
        case .back(let header),
             .backAndMenu(let header),
             .backAndEdit(let header),
             .close(let header),
             .none(let header),
             .title(_, let header),
             .titleAndClose(_, let header),
             .editAndClose(let header),
             .titleAndBack(_, let header),
             .confirmAndBack(_, let header):
            return header
        }
    }
    
    private static func setBarAppearance(headerType: NavigationHeaderType) -> UINavigationBarAppearance {
        let barAppearance = UINavigationBarAppearance()
        switch headerType {
        case .clear:
            barAppearance.configureWithTransparentBackground()
        case .black:
            barAppearance.backgroundColor = .grayscale900
            barAppearance.shadowColor = .clear
        }
        barAppearance.titleTextAttributes = [
            .font: FontManager.sub1Sb20.font,
            .foregroundColor: UIColor.white
        ]
        barAppearance.buttonAppearance.normal.titleTextAttributes = [
            .font: FontManager.body2M16.font,
            .foregroundColor: UIColor.primary300
        ]
        barAppearance.buttonAppearance.disabled.titleTextAttributes = [
            .font: FontManager.body2M16.font,
            .foregroundColor: UIColor.grayscale600
        ]
        return barAppearance
    }
    
    private static func configureNavigationItem(
        navigationItem: UINavigationItem,
        target: AnyObject?,
        type: NavigationBarType,
        action: Selector?,
        secondAction: Selector? = nil
    ) {
        switch type {
        case .back:
            let backButtonItem = makeBarButtonItem(image: .left.withTintColor(.white), target: target, action: action)
            navigationItem.leftBarButtonItems = [makeSpacer(), backButtonItem]
            
        case .backAndMenu:
            let backButtonItem = makeBarButtonItem(image: .left.withTintColor(.white), target: target, action: action)
            navigationItem.leftBarButtonItems = [makeSpacer(), backButtonItem]
            makeTopRightButtonItem(image: .menu, target: target, navigationItem: navigationItem, action: secondAction, padding: 0)
            
        case .backAndEdit:
            let backButtonItem = makeBarButtonItem(image: .left.withTintColor(.white), target: target, action: action)
            navigationItem.leftBarButtonItems = [makeSpacer(), backButtonItem]
            let editButtonItem = makeBarButtonItem(image: .edit, target: target, action: secondAction)
            navigationItem.rightBarButtonItems = [makeSpacer(), editButtonItem]
            
        case .title(let string, _):
            navigationItem.title = string
            
        case .close:
            makeTopRightButtonItem(image: .xicon, target: target, navigationItem: navigationItem, action: action)
            
        case .titleAndClose(let string, _):
            navigationItem.title = string
            makeTopRightButtonItem(image: .xicon, target: target, navigationItem: navigationItem, action: action)
            
        case .titleAndBack(let string, _):
            navigationItem.title = string
            let backButtonItem = makeBarButtonItem(image: .left.withTintColor(.white), target: target, action: action)
            navigationItem.leftBarButtonItems = [makeSpacer(), backButtonItem]
            
        case .editAndClose:
            let editButtonItem = makeBarButtonItem(image: .edit, target: target, action: secondAction)
            navigationItem.leftBarButtonItems = [makeSpacer(), editButtonItem]
            makeTopRightButtonItem(image: .xicon, target: target, navigationItem: navigationItem, action: action, padding: 8)
            
        case .confirmAndBack:
            let backButtonItem = makeBarButtonItem(image: .left.withTintColor(.white), target: target, action: action)
            let confirmButtonItem = makeBarButtonItem(title: "완료", target: target, action: secondAction)
            navigationItem.leftBarButtonItems = [makeSpacer(), backButtonItem]
            navigationItem.rightBarButtonItems = [makeSpacer(padding: 16), confirmButtonItem]
            
        case .none:
            let emptyItem = makeBarButtonItem(image: UIImage(), target: target, action: nil)
            navigationItem.leftBarButtonItem = emptyItem
        }
    }
    
    private static func registerBarAppearance(
        _ barAppearance: UINavigationBarAppearance,
        to navigationController: UINavigationController?
    ) {
        navigationController?.navigationBar.standardAppearance = barAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
    }
    
    private static func makeBarButtonItem(
        image: UIImage? = nil,
        title: String? = nil,
        target: AnyObject?,
        action: Selector?
    ) -> UIBarButtonItem {
        if let image {
            return UIBarButtonItem(
                image: image.withTintColor(.white).withRenderingMode(.alwaysOriginal),
                style: .plain,
                target: target,
                action: action
            )
        }
        if let title {
            return UIBarButtonItem(title: title, style: .plain, target: target, action: action)
        }
        return UIBarButtonItem(title: "기본", style: .plain, target: target, action: action)
    }
    
    private static func makeTopRightButtonItem(
        image: UIImage,
        target: AnyObject?,
        navigationItem: UINavigationItem,
        action: Selector?,
        padding: CGFloat = 16
    ) {
        let closeButtonItem = makeBarButtonItem(image: image, target: target, action: action)
        let spacer = makeSpacer(padding: padding)
        navigationItem.rightBarButtonItems = [spacer, closeButtonItem]
    }
    
    private static func makeSpacer(padding: CGFloat = 2) -> UIBarButtonItem {
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = padding
        return spacer
    }
}
