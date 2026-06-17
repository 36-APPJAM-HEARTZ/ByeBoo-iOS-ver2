//
//  MockAuthRepository.swift
//  Data
//
//  Created by 최주리 on 6/17/26.
//

import DomainInterface
import DataInterface

final class MockAuthRepository: AuthInterface {
    
    private(set) var kakaoLoginCalled = false
    private(set) var appleLoginCalled = false
    private(set) var isAutoLoginCalled = false
    private(set) var isLogoutCalled = false
    private(set) var isWithdrawCalled = false
    
    private let network: NetworkService
    private let userDefaultsService: UserDefaultService
    private let keychainService: KeychainService
    
    init(
        network: NetworkService,
        userDefaultsService: UserDefaultService,
        keychainService: KeychainService
    ) {
        self.network = network
        self.userDefaultsService = userDefaultsService
        self.keychainService = keychainService
    }
    
    func kakaoLogin(platform: LoginPlatform) async throws  {
        kakaoLoginCalled = true
        
        let authorization = try await network.kakaoRequest()
        let _ = userDefaultsService.save("KAKAO", key: .loginPlatform)
        keychainService.save(key: .authorization, token: authorization)
        try await postLogin(platform: platform)
    }
    
    func appleLogin(platform: LoginPlatform) async throws {
        appleLoginCalled = true
        
        let (identityToken, authorizationCode) = try await network.appleRequest()
        let _ = userDefaultsService.save("APPLE", key: .loginPlatform)
        keychainService.save(key: .authorization, token: identityToken)
        keychainService.save(key: .authorizationCode, token: authorizationCode)
        try await postLogin(platform: platform)
    }
    
    func autoLogin() async throws -> Bool {
        isAutoLoginCalled = true
        return true
    }
    
    func logout() async throws -> Bool {
        isLogoutCalled = true
        return true
    }
    
    func withdraw() async throws -> Bool {
        isWithdrawCalled = true
        return true
    }
    
    func clearKeychain() {}
    
    private func postLogin(platform: LoginPlatform) async throws {
        let postLoginResult = PostLoginResponseDTO.stub()
        
        _ = userDefaultsService.save(postLoginResult.isRegistered, key: .isRegistered)
        _ = userDefaultsService.save(postLoginResult.name ?? "" , key: .userName)
        _ = userDefaultsService.save(postLoginResult.journey ?? "", key: .journey)
        _ = userDefaultsService.save(postLoginResult.journeyStatus ?? "", key: .journeyStatus)
        _ = userDefaultsService.save(postLoginResult.userId, key: .userID)
        
        keychainService.save(key: .accessToken, token: postLoginResult.accessToken)
        keychainService.save(key: .refreshToken, token: postLoginResult.refreshToken)
        
        keychainService.delete(key: .authorization)
        keychainService.delete(key: .authorizationCode)
    }
}

