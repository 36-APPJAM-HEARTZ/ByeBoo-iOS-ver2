//
//  DefaultAutoLoginUseCase.swift
//  Domain
//
//  Created by 최주리 on 6/16/26.
//

import DomainInterface

public struct DefaultAutoLoginUseCase: AutoLoginUseCase {
    private let repository: AuthInterface
    
    public init(repository: AuthInterface) {
        self.repository = repository
    }
    
    public func execute()  async throws  -> Bool {
        return try await repository.autoLogin()
    }
}
