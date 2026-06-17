//
//  Encodable+.swift
//  ByeBoo-iOS
//
//  Created by APPLE on 7/13/25.
//

import Foundation

import Core

extension Encodable {
    func toDictionary<T: Sendable>() throws -> [String: T] {
        let data = try JSONEncoder().encode(self)
        let json = try JSONSerialization.jsonObject(with: data)
        guard let dictionary = json as? [String: T] else {
            throw ByeBooError.encodingError
        }
        
        return dictionary
    }
}
