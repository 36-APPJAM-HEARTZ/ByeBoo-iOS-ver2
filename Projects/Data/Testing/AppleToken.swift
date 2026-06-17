//
//  AppleToken.swift
//  Data
//
//  Created by 최주리 on 6/17/26.
//


struct AppleToken {
    let identityToken: String
    let authorizationCode: String
}

extension AppleToken {
    static func stub() -> AppleToken {
        .init(
            identityToken: "identityToken",
            authorizationCode: "authorizationCode"
        )
    }
}
