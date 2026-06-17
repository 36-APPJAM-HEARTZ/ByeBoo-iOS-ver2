//
//  GetUserIDUseCase.swift
//  ByeBoo-iOS
//
//  Created by APPLE on 7/14/25.
//

import DomainInterface

public struct DefaultGetUserIDUseCase: GetUserIDUseCase {
    
    private let repository: UsersInterface
    
    public init(repository: UsersInterface) {
        self.repository = repository
    }
    
    public func execute() -> Int? {
        return repository.getUserID()
    }
}
