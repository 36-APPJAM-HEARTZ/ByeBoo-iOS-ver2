//
//  BlockedUserEntity.swift
//  ByeBoo-iOS
//
//  Created by 이나연 on 3/9/26.
//

public struct BlockedUserEntity {
    let blockID: Int
    let name: String
    
    public init(blockID: Int, name: String) {
        self.blockID = blockID
        self.name = name
    }
}
