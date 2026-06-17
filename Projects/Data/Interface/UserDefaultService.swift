//
//  UserDefaultService.swift
//  Data
//
//  Created by 최주리 on 6/17/26.
//


public protocol UserDefaultService {
    func save(_ value: Any, key: UserDefaultsKey) -> Bool
    func load<T>(key: UserDefaultsKey) -> T?
    func delete(key: UserDefaultsKey) -> Bool
}