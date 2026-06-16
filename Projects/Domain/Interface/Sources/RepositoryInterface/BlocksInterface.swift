//
//  BlocksInterface.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 3/5/26.
//

/// 차단 관련 데이터 처리를 위한 리포지토리 인터페이스입니다.
public protocol BlocksInterface {
    /// 사용자를 차단합니다.
    /// - Parameter userID: 차단할 사용자 ID
    func blockUser(userID: Int) async throws
    
    /// 차단된 사용자를 해제합니다.
    /// - Parameter blockID: 차단 목록에서의 고유 ID
    func deleteBlockedUser(blockID: Int) async throws
    
    /// 차단된 사용자 목록을 가져옵니다.
    /// - Returns: 차단된 사용자 엔티티 배열
    func getBlockedUsersList() async throws -> [BlockedUserEntity]
}

