//
//  FetchQuestStatusUseCase.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 7/14/25.
//

import DomainInterface

public struct DefaultFetchQuestStatusUseCase: FetchQuestStatusUseCase {
    
    private let repository: UsersInterface
    
    public init(repository: UsersInterface) {
        self.repository = repository
    }
    
    public func execute() async throws -> UserQuestStatusEntity {
        return try await repository.fetchQuestStatus()
    }
}
