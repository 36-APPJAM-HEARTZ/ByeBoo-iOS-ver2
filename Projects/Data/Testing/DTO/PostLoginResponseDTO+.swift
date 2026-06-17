//
//  PostLoginResponseDTO+.swift
//  Data
//
//  Created by 최주리 on 6/17/26.
//

extension PostLoginResponseDTO {
    static func stub() -> Self {
        .init(
            accessToken: "accessToken",
            refreshToken: "refreshToken",
            isRegistered: true,
            name: "name",
            journey: "journey",
            journeyStatus: "journeyStatus",
            userId: 0
        )
    }
}
