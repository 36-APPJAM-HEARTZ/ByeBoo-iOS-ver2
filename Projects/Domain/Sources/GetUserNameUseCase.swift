//
//  GetUserNameUseCase.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 7/11/25.
//

import DomainInterface

public struct DefaultGetUserNameUseCase: GetUserNameUseCase {
    private let repository: UsersInterface
    
    public init(repository: UsersInterface) {
        self.repository = repository
    }
    
    public func execute() -> String {
        return repository.getUserName() ?? "이름"
    }
}
