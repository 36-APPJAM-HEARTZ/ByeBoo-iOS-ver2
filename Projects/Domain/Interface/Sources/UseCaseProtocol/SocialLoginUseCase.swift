//
//  SocialLoginUseCase.swift
//  Domain
//
//  Created by 최주리 on 6/16/26.
//


public protocol SocialLoginUseCase {
    func execute(platform: LoginPlatform) async throws
}
