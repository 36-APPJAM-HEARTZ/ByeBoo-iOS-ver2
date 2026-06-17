//
//  GetIsRegisteredUseCase.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 8/27/25.
//

import DomainInterface

public struct DefaultGetIsRegisteredUseCase: GetIsRegisteredUseCase {
    private let repository: UsersInterface
    
    public init(repository: UsersInterface) {
        self.repository = repository
    }
    
    public func execute() -> Bool {
        return repository.getIsRegistered()
    }
}
