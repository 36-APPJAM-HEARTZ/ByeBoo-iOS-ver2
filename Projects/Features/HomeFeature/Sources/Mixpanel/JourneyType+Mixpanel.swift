//
//  JourneyType+.swift
//  HomeFeature
//
//  Created by 최주리 on 6/19/26.
//

import DomainInterface

extension JourneyType {
    var mixpanelKey: String {
        switch self {
        case .recording:
            "이별 극복"
        case .active:
            "감정 정리"
        case .reunion:
            "재회 준비"
        }
    }
}
