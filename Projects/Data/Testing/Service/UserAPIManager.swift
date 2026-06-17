//
//  MockUserAPI.swift
//  ByeBoo-iOS
//
//  Created by APPLE on 10/29/25.
//

import Foundation

protocol UserAPIManager {
    func isKakaoTalkLoginAvailable() -> Bool
    func loginWithKakaoTalk(completion: @escaping (MockOAuthToken?, (any Error)?) -> Void)
    func loginWithKakaoAccount(completion: @escaping (MockOAuthToken?, (any Error)?) -> Void)
}

struct MockUserAPI: UserAPIManager {
    
    private let isAvailable: Bool
    private let oAuthToken = MockOAuthToken.stub()
    
    init(isAvailable: Bool) {
        self.isAvailable = isAvailable
    }
    
    func isKakaoTalkLoginAvailable() -> Bool {
        return isAvailable
    }
    
    func loginWithKakaoTalk(completion: @escaping (MockOAuthToken?, (any Error)?) -> Void) {
        completion(oAuthToken, nil)
    }
    
    func loginWithKakaoAccount(completion: @escaping (MockOAuthToken?, (any Error)?) -> Void) {
        completion(oAuthToken, nil)
    }
}
