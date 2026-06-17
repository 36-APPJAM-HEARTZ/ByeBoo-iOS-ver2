//
//  KeychainService.swift
//  Data
//
//  Created by 최주리 on 6/17/26.
//


public protocol KeychainService: Sendable {
    func save(key: KeyType, token: String)
    func load(key: KeyType) -> String
    func delete(key: KeyType)
}