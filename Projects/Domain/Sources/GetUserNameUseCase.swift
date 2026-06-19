//
//  GetUserNameUseCase.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 7/11/25.
//

import DomainInterface

struct DefaultGetUserNameUseCase: GetUserNameUseCase {
    private let repository: UsersInterface
    
    init(repository: UsersInterface) {
        self.repository = repository
    }
    
    func execute() -> String {
        return repository.getUserName() ?? "이름"
    }
}
