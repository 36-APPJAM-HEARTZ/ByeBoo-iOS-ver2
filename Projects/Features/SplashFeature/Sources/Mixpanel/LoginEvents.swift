//
//  LoginEvents.swift
//  SplashFeature
//
//  Created by 최주리 on 6/11/26.
//


import Mixpanel

import PresentationKit

struct LoginEvents {
    enum Name {
        static let login = "login"
    }
}

extension LoginEvents {
    struct LoginProperty: MixpanelProperty {
        let isLoginComplete: Bool
        let logintype: String
        
        var dictionary: [String : MixpanelType] {
            [
                "is_login_complete": isLoginComplete,
                "login_type": logintype
            ]
        }
    }
}
