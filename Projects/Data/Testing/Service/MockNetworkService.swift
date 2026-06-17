//
//  MockNetworkService.swift
//  Data
//
//  Created by 최주리 on 6/17/26.
//

import Foundation

final class MockNetworkService: NetworkService {
    
    private(set) var kakaoRequestCalled = false
    private(set) var appleRequestCalled = false
    private let userAPI: UserAPIManager
    
    init(userAPI: UserAPIManager) {
        self.userAPI = userAPI
    }
    
    func request<T>(_ endPoint: any EndPoint, decodingType: T.Type) throws -> T where T : Decodable {
        let dummyJSON = "{}".data(using: .utf8)!
        return try JSONDecoder().decode(T.self, from: dummyJSON)
    }
    
    func request(_ endPoint: any EndPoint) throws { }
    
    func request(image: Data, signedURL: String) throws { }
    
    func kakaoRequest() throws -> String {
        kakaoRequestCalled = true
        
        var idToken: String?
        
        if userAPI.isKakaoTalkLoginAvailable() {
            userAPI.loginWithKakaoTalk { oauthToken, error in
                idToken = oauthToken?.accessToken
            }
        } else {
            userAPI.loginWithKakaoAccount { oauthToken, error in
                idToken = oauthToken?.accessToken
            }
        }
        
        return idToken ?? ""
    }
    
    func appleRequest() throws -> (String, String) {
        appleRequestCalled = true
        
        let identityToken = AppleToken.stub().identityToken
        let authorizationCode = AppleToken.stub().authorizationCode
       
        return (identityToken, authorizationCode)
    }
}
