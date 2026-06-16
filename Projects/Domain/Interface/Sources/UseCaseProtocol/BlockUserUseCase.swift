//
//  BlockUserUseCase.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 3/7/26.
//

/// 사용자 차단 비즈니스 로직을 수행하는 UseCase 프로토콜입니다.
public protocol BlockUserUseCase {
    /// - Parameter userID: 차단할 사용자의 고유 ID
    func execute(userID: Int) async throws
}

