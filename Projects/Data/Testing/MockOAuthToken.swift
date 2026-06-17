//
//  OAuthTokenFactory.swift
//  ByeBoo-iOS
//
//  Created by APPLE on 10/29/25.
//

struct MockOAuthToken {
    let accessToken: String
    let tokenType: String
    let refreshToken: String
    let scope: String?
    let scopes: [String]?
}

extension MockOAuthToken {
    static func stub() -> Self {
        return .init(
            accessToken: "accessToken",
            tokenType: "tokenType",
            refreshToken: "refreshToken",
            scope: nil,
            scopes: nil
        )
    }
}
