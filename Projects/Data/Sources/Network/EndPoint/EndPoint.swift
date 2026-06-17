//
//  EndPoint.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 6/28/25.
//

import Foundation

import Alamofire

import Core

/// API 요청을 위한 엔드포인트를 정의하는 프로토콜입니다.
/// 이 프로토콜을 채택하여 서버의 각 API 경로, 메서드, 파라미터 등을 명세합니다.
///
/// ### 사용 예시
/// ```swift
/// enum UserAPI {
///     case fetchProfile(userID: Int)
/// }
///
/// extension UserAPI: EndPoint {
///     var basePath: String { "/api/v1/users" }
///     var path: String {
///         switch self {
///         case .fetchProfile(let id): return "/\(id)"
///         }
///     }
///     var method: HTTPMethod { .get }
///     var headers: HeaderType { .withAuth }
///     // ... 나머지 구현
/// }
/// ```
public protocol EndPoint {
    /// API의 기본 경로 (예: `/api/v1/items`)
    var basePath: String { get }
    
    /// 세부 API 경로 (예: `/123/details`)
    var path: String { get }
    
    /// HTTP 요청 메서드 (GET, POST, PUT, DELETE 등)
    var method: HTTPMethod { get }
    
    /// 요청 헤더 타입 (공통 헤더, 인증 포함 헤더 등)
    var headers: HeaderType { get }
    
    /// 파라미터 인코딩 방식 (JSON, QueryString 등)
    var parameterEncoding: ParameterEncoding { get }
    
    /// URL 쿼리에 포함될 파라미터 딕셔너리
    var queryParameters: [String: String]? { get }
    
    /// HTTP Body에 포함될 파라미터 딕셔너리
    var bodyParameters: Parameters? { get }
    
    /// 완성된 전체 요청 URL
    var requestURL: URL { get }
}


public extension EndPoint {
    var requestURL: URL {
        let baseURL = ConfigManager.baseURL
        let urlString = baseURL + basePath + path
        
        guard var urlComponents = URLComponents(string: urlString) else {
            ByeBooLogger.error(ByeBooError.URLError)
            return URL(string: "")!
        }
        
        if let queryParameters {
            urlComponents.queryItems = queryParameters.map {
                URLQueryItem(name: $0, value: $1)
            }
        }
        
        guard let url = urlComponents.url else {
            ByeBooLogger.error(ByeBooError.URLError)
            return URL(string: "")!
        }
        
        return url
    }
}

public enum HeaderType {
    case basic
    case withAuth
    case refresh(refreshToken: String)
    case kakaoLoginHeader(accessToken: String)
    case appleLoginHeader(acessToken: String, authorizationCode: String)
    
    var value: HTTPHeaders {
        switch self {
        case .basic:
            return ["Content-Type": "application/json"]
        case .withAuth:
            return [
                "Content-Type": "application/json",
                "X-Requires-Auth": "true"
            ]
        case .refresh(let token), .kakaoLoginHeader(let token):
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        case .appleLoginHeader(let acessToken, let authorizationCode):
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(acessToken)",
                "X-Apple-Code": "\(authorizationCode)"
            ]
        }
    }
}
