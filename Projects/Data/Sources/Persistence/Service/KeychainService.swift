//
//  KeychainService.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 6/25/25.
//

import Foundation

public protocol KeychainService: Sendable {
    func save(key: KeyType, token: String)
    func load(key: KeyType) -> String
    func delete(key: KeyType)
}

public struct DefaultKeychainService: KeychainService {
    public init() { }
    
    public func save(key: KeyType, token: String) {
        KeychainManager.save(key: key, token: token)
    }
    
    public func load(key: KeyType) -> String {
        KeychainManager.load(key: key)
    }
    
    public func delete(key: KeyType) {
        KeychainManager.delete(key: key)
    }
}

//public final class MockKeychainService: KeychainService {
//    
//    private var store: [KeyType: Any] = [:]
//    
//    public func save(key: KeyType, token: String) {
//        store[key] = token
//    }
//    
//    public func load(key: KeyType) -> String {
//        guard let value = store[key] as? String else {
//            return ""
//        }
//        return value
//    }
//    
//    public func delete(key: KeyType) {
//        store.removeValue(forKey: key)
//    }
//    
//    func deleteAll() {
//        store.removeAll()
//    }
//}
