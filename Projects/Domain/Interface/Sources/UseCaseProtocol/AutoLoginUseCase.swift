//
//  AutoLoginUseCase.swift
//  Domain
//
//  Created by 최주리 on 6/16/26.
//

public protocol AutoLoginUseCase {
    func execute() async throws -> Bool
}
