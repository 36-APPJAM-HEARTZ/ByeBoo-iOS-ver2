//
//  BlockUserUseCase.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 3/7/26.
//

import DomainInterface

public struct DefaultBlockUserCase: BlockUserUseCase {
    private let repository: BlocksInterface
    
    public init(repository: BlocksInterface) {
        self.repository = repository
    }
    
    public func execute(userID: Int) async throws {
        try await repository.blockUser(userID: userID)
    }
}
