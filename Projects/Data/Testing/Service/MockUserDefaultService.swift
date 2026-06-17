//
//  MockUserDefaultService.swift
//  Data
//
//  Created by 최주리 on 6/17/26.
//


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
