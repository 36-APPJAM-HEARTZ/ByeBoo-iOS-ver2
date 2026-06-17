//
//  MockUserRepository.swift
//  Data
//
//  Created by 최주리 on 6/17/26.
//

import DomainInterface

final class MockUserRepository: UsersInterface {
//    var questStatus: UserQuestStatusEntity = .init(
//        todayComplete: true,
//        currentStatus: .afterJourney,
//        questCount: 0
//    )
//    var isHelperShown: Bool = true
//    var isAllowed = false
    
//    init(
//        questStatus: UserQuestStatusEntity? = nil,
//        isHelperShown: Bool? = nil
//    ) {
//        if let questStatus {
//            self.questStatus = questStatus
//        }
//        
//        if let isHelperShown {
//            self.isHelperShown = isHelperShown
//        }
//    }
    
//    func getUserName() -> String? {
//        "하츠핑"
//    }
    
    func getUserID() -> Int? {
        1
    }
    
//    func setHelperShown() { }
    
//    func getIsHelperShown() -> Bool? {
//        isHelperShown
//    }
//    
//    func fetchJourney() async throws -> JourneyEntity {
//        return .stub()
//    }
//    
//    func sendUser(
//        name: String,
//        questStyle: String
//    ) async throws -> UserEntity {
//        return .stub(
//            name: name,
//            feeling: "RECORDING",
//            questStyle: questStyle
//        )
//    }
//    
//    func fetchCharacterDialogue() async throws -> DialogueEntity {
//        return .stub()
//    }
//    
//    func fetchQuestStatus() async throws -> UserQuestStatusEntity {
//        return questStatus
//    }
//    
//    func startJourney() async throws { }
    
    func getIsRegistered() -> Bool {
        return false
    }
    
//    func modifyUserNickname(name: String) -> String {
//        name
//    }
//    
//    func getLastJourneyType() -> JourneyType {
//        .reunion
//    }
//    
//    func updateNotificationPermission() -> Bool {
//        isAllowed.toggle()
//        return isAllowed
//    }
//    
//    func checkHasEnterMyPage() -> Bool {
//        return true
//    }
//    
//    func fetchMyCommonQuestAnswers(cursor: Int?) async throws -> CommonQuestMyAnswersEntity {
//        .stub()
//    }
//    
//    var alarmEnabled: Bool {
//        return true
//    }
}
