//
//  UserDefaultService.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 6/25/25.
//

import Foundation

import DataInterface

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
