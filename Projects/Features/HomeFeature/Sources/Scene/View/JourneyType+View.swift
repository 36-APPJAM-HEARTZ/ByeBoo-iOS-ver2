//
//  JourneyType.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 7/18/25.
//

import UIKit

import DomainInterface

public extension JourneyType {
    var title: String {
        switch self {
        case .recording:
            "이별 극복"
        case .active:
            "감정 정리"
        case .reunion:
            "재회 준비"
        }
    }
    
//    var tagTitle: String {
//        switch self {
//        case .recording:
//            "이별"
//        case .active:
//            "행동형"
//        case .reunion:
//            "재회"
//        }
//    }
    
    var description: String {
        return "\(title) 여정"
    }
    
    static func titleToEnum(_ title: String) -> Self? {
        return Self.allCases.first { $0.title == title || $0.description == title }
    }
}
