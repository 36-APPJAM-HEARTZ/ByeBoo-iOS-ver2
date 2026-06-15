//
//  BlocksRepository.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 3/5/26.
//

import Foundation

import DomainInterface

public struct DefaultBlocksRepository: BlocksInterface {
    
    private let networkService: NetworkService
    
    public init(
        networkService: NetworkService
    ) {
        self.networkService = networkService
    }
    
    public func blockUser(userID: Int) async throws {
        try await networkService.request(BlocksAPI.blockUser(userID: userID))
    }
    
    public func deleteBlockedUser(blockID: Int) async throws {
        try await networkService.request(BlocksAPI.deleteBlockedUser(userID: blockID))
    }
    
    public func getBlockedUsersList() async throws -> [BlockedUserEntity] {
        let blockList = try await networkService.request(
            BlocksAPI.getBlockList,
            decodingType: GetBlockedUserListResponseDTO.self
        )
        return blockList.toEntity()
    }
}
