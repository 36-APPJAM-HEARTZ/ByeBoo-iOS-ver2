//
//  KeychainService.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 6/25/25.
//

import Foundation

import DataInterface

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
