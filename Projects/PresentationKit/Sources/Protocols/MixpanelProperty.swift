//
//  MixpanelType.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 9/16/25.
//

import Mixpanel

/// Mixpanel 분석 도구에 전달할 속성을 정의하는 프로토콜입니다.
/// 분석용 데이터를 딕셔너리 형태로 변환할 수 있게 합니다.
public protocol MixpanelProperty {
    /// Mixpanel 서버로 전송할 속성 딕셔너리입니다.
    var dictionary: [String: MixpanelType] { get }
}


