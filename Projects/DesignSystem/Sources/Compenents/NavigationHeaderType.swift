//
//  NavigationHeaderType.swift
//  DesignSystem
//
//  Created by 최주리 on 6/11/26.
//


import UIKit
import SnapKit

/// 네비게이션 바 배경의 스타일을 정의합니다.
public enum NavigationHeaderType {
    /// 투명한 배경
    case clear
    /// 검정색 배경 (grayscale900)
    case black
}

/// 네비게이션 바의 버튼 구성 타입을 정의합니다.
public enum NavigationBarType: Equatable {
    /// 뒤로가기 버튼만 포함
    case back(header: NavigationHeaderType = .clear)
    /// 뒤로가기 + 메뉴 버튼 포함
    case backAndMenu(header: NavigationHeaderType = .clear)
    /// 뒤로가기 + 편집 버튼 포함
    case backAndEdit(header: NavigationHeaderType = .clear)
    /// 타이틀만 포함
    case title(String, header: NavigationHeaderType = .clear)
    /// 닫기 버튼만 포함
    case close(header: NavigationHeaderType = .clear)
    /// 타이틀 + 닫기 버튼 포함
    case titleAndClose(String, header: NavigationHeaderType = .clear)
    /// 타이틀 + 뒤로가기 버튼 포함
    case titleAndBack(String, header: NavigationHeaderType = .clear)
    /// 편집 + 닫기 버튼 포함
    case editAndClose(header: NavigationHeaderType = .clear)
    /// 완료 + 뒤로가기 버튼 포함
    case confirmAndBack(String, header: NavigationHeaderType = .clear)
    /// 버튼 없음
    case none(header: NavigationHeaderType = .clear)
}

/// ByeBoo 프로젝트 전용 네비게이션 바 생성 및 관리 도구입니다.
@MainActor
public struct ByeBooNavigationBar {
    
    /// 네비게이션 바를 설정하고 아이템을 배치합니다.
    /// - Parameters:
    ///   - navigationItem: 설정할 UIViewController의 navigationItem
    ///   - navigationController: 설정을 적용할 UINavigationController
    ///   - type: 구성할 바의 타입 (NavigationBarType)
    ///   - target: 액션을 수신할 객체
    ///   - action: 기본 액션 (주로 왼쪽 버튼)
    ///   - secondAction: 보조 액션 (주로 오른쪽 버튼)
    public static func makeNavigationBar(
        navigationItem: UINavigationItem,
        navigationController: UINavigationController?,
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
