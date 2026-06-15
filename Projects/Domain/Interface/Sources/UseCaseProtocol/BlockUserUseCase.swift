//
//  BlockUserUseCase.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 3/7/26.
//

public protocol BlockUserUseCase {
    func execute(userID: Int) async throws
}
