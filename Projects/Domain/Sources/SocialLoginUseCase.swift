//
//  KakaoLoginUseCase.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 8/26/25.
//

import DomainInterface

public struct DefaultSocialLoginUseCase: SocialLoginUseCase {
    private var repository: AuthInterface
    
    public init(repository: AuthInterface) {
        self.repository = repository
    }
    
    public func execute(platform: LoginPlatform) async throws {
        switch platform {
        case .KAKAO:
            return try await repository.kakaoLogin(platform: platform)
        case .APPLE:
            return try await repository.appleLogin(platform: platform)
        }
        
    }
}
