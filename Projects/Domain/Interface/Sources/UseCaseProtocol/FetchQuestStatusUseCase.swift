//
//  FetchQuestStatusUseCase.swift
//  Domain
//
//  Created by 최주리 on 6/19/26.
//


import Foundation

public protocol FetchQuestStatusUseCase {
    func execute() async throws -> UserQuestStatusEntity
}
