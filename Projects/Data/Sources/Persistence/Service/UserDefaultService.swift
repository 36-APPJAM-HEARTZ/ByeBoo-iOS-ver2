//
//  UserDefaultService.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 6/25/25.
//

import Foundation

public protocol UserDefaultService {
    func save(_ value: Any, key: UserDefaultsKey) -> Bool
    func load<T>(key: UserDefaultsKey) -> T?
    func delete(key: UserDefaultsKey) -> Bool
}

public struct DefaultUserDefaultService: UserDefaultService {
    public init() { }
    
    public func save(_ value: Any, key: UserDefaultsKey) -> Bool {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
        return UserDefaults.standard.value(forKey: key.rawValue) != nil
    }
    
    public func load<T>(key: UserDefaultsKey) -> T? {
        UserDefaults.standard.value(forKey: key.rawValue) as? T
    }
    
    public func delete(key: UserDefaultsKey) -> Bool {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        return UserDefaults.standard.value(forKey: key.rawValue) == nil
    }
}

public final class MockUserDefaultService: UserDefaultService {
    
    private var store: [UserDefaultsKey: Any] = [:]
    
    public init() { }
    
    public func save(_ value: Any, key: UserDefaultsKey) -> Bool {
        store[key] = value
        return true
    }
    
    public func load<T>(key: UserDefaultsKey) -> T? {
        return store[key] as? T
    }
    
    public func delete(key: UserDefaultsKey) -> Bool {
        guard let _ = store.removeValue(forKey: key) else {
            return false
        }
        return true
    }
    
    func deleteAll() {
        store.removeAll()
    }
}
