//
//  UserQuestStatusEntity.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 8/21/25.
//

import Foundation

public struct UserQuestStatusEntity {
    public let todayComplete: Bool
    public let currentStatus: HomeState
    public let questCount: Int
    
    public init(todayComplete: Bool, currentStatus: HomeState, questCount: Int) {
        self.todayComplete = todayComplete
        self.currentStatus = currentStatus
        self.questCount = questCount
    }
}
