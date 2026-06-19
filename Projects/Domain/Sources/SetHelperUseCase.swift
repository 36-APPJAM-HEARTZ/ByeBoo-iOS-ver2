//
//  Untitled.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 8/17/25.
//

import DomainInterface

public struct DefaultSetHelperUseCase: SetHelperUseCase {
    private let repository: UsersInterface
    
    public init(repository: UsersInterface) {
        self.repository = repository
    }
    
    public func execute() {
        repository.setHelperShown()
    }
}
