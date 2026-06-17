//
//  File.swift
//  SplashFeature
//
//  Created by 최주리 on 6/16/26.
//

import DomainInterface

extension LoginPlatform {
    var mixpanelKey: String {
        switch self {
        case .KAKAO:
            "Kakao"
        case .APPLE:
            "Apple"
        }
    }
}
