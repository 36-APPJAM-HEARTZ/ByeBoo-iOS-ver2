//
//  TokenService.swift
//  Data
//
//  Created by 최주리 on 6/17/26.
//


public protocol TokenService: Sendable {
    func reissue() async throws
}