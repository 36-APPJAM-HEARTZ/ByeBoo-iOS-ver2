//
//  BaseView.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 7/4/25.
//

import UIKit

/// 모든 UIView의 기본 클래스입니다.
/// 스타일 설정, 계층 구조 설정, 레이아웃 설정을 분리하여 관리할 수 있게 합니다.
open class BaseView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// UI 컴포넌트의 속성(폰트, 컬러, 클로저 기반 설정 등)을 정의합니다.
    open func setStyle() {}
    
    /// 뷰의 계층 구조(`addSubview`)를 정의합니다.
    open func setUI() {}
    
    /// 오토레이아웃(`SnapKit` 등)을 정의합니다.
    open func setLayout() {}
}

