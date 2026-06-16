//
//  AuthInterface.swift
//  Domain
//
//  Created by 최주리 on 6/16/26.
//

public protocol AuthInterface {
//    func kakaoLogin(platform: LoginPlatform) async throws
//    func appleLogin(platform: LoginPlatform) async throws
    func autoLogin() async throws -> Bool
//    func logout() async throws -> Bool
//    func withdraw() async throws -> Bool
}
