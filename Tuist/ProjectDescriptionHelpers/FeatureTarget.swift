//
//  FeatureTarget.swift
//  Manifests
//
//  Created by 최주리 on 6/9/26.
//

import ProjectDescription

public enum FeatureTarget {
    case app                // 앱 타겟
    case framework          // 구현체
    case interface          // 프로토콜, 모델 공개
    case testing            // Mock, Stub
    case unitTest           // 유닛 테스트
    case demo               // 단독 실행 앱
}
