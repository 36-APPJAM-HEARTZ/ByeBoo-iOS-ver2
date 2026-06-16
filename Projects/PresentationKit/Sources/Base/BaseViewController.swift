//
//  BaseViewController.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 7/4/25.
//

import UIKit

/// 모든 UIViewController의 기본 클래스입니다.
/// 이 클래스를 상속받아 표준화된 UI 설정 메서드 라이프사이클을 사용할 수 있습니다.
@MainActor
open class BaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        setView()
        setAddTarget()
        setDelegate()

    }

    /// 뷰의 초기 설정을 수행합니다.
    open func setView() {}

    /// UI 컴포넌트의 타겟-액션(AddTarget) 설정을 수행합니다.
    open func setAddTarget() {}

    /// 대리자(Delegate) 설정을 수행합니다.
    open func setDelegate() {}
}

