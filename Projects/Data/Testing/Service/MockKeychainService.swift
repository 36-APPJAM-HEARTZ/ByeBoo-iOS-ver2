//
//  MockKeychainService.swift
//  Data
//
//  Created by 최주리 on 6/17/26.
//


public final class MockKeychainService: KeychainService {
    
    private var store: [KeyType: Any] = [:]
    
    public func save(key: KeyType, token: String) {
        store[key] = token
    }
    
    public func load(key: KeyType) -> String {
        guard let value = store[key] as? String else {
            return ""
        }
        return value
    }
    
    public func delete(key: KeyType) {
        store.removeValue(forKey: key)
    }
    
    func deleteAll() {
        store.removeAll()
    }
}
