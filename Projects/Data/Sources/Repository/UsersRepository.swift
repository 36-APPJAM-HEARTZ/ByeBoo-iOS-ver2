//
//  UsersRepository.swift
//  ByeBoo-iOS
//
//  Created by 최주리 on 7/10/25.
//

import DomainInterface
import DataInterface

public struct DefaultUsersRepository: UsersInterface {
    
    private let network: NetworkService
    private let userDefaultsService: UserDefaultService
    private let keychainService: KeychainService
    
    public init(
        network: NetworkService,
        userDefaultsService: UserDefaultService,
        keychainService: KeychainService
    ) {
        self.network = network
        self.userDefaultsService = userDefaultsService
        self.keychainService = keychainService
    }
    
    // MARK: Network
    
//    func fetchJourney() async throws -> JourneyEntity {
//        let result = try await network.request(
//            UsersAPI.journey,
//            decodingType: UserJourneyResponseDTO.self
//        )
//        
//        return result.toEntity()
//    }
//    
//    func sendUser(
//        name: String,
//        questStyle: String
//    ) async throws -> UserEntity {
//        let userRequestDTO: UserRequestDTO = .init(
//            name: name,
//            questStyle: questStyle
//        )
//        let result = try await network.request(
//            UsersAPI.sendUser(
//                requestDTO: userRequestDTO
//            ),
//            decodingType: UserResponseDTO.self
//        )
//        let _ = userDefaultsService.save(result.id, key: .userID)
//        let _ = userDefaultsService.save(result.name, key: .userName)
//        let _ = userDefaultsService.save(true, key: .isRegistered)
//        let _ = userDefaultsService.save(false, key: .hasEnterMyPage)
//        let _ = userDefaultsService.save(false, key: .alarmEnabled)
//        
//        ByeBooLogger.debug("유저 여정 \(questStyle)")
//        ByeBooLogger.debug("유저 정보 저장 완료")
//        return result.toEntity()
//    }
//    
//    func fetchCharacterDialogue() async throws -> DialogueEntity {
//        let result = try await network.request(
//            UsersAPI.character,
//            decodingType: DialogueResponseDTO.self
//        )
//        
//        return result.toEntity()
//    }
//    
//    func fetchQuestStatus() async throws -> UserQuestStatusEntity {
//        let result = try await network.request(
//            UsersAPI.count,
//            decodingType: UserQuestStatusResponseDTO.self
//        )
//        
//        return result.toEntity()
//    }
//    
//    func startJourney() async throws {
//        try await network.request(UsersAPI.start)
//    }
//    
//    // MARK: Persistence
//    
//    func getUserName() -> String? {
//        userDefaultsService.load(key: .userName)
//    }
//    
    public func getUserID() -> Int? {
        userDefaultsService.load(key: .userID)
    }
    
//    func setHelperShown() {
//        _ = userDefaultsService.save(true, key: .isHelperShown)
//    }
//    
//    func getIsHelperShown() -> Bool? {
//        return userDefaultsService.load(key: .isHelperShown)
//    }
//    
    public func getIsRegistered() -> Bool {
        return userDefaultsService.load(key: .isRegistered) ?? false
    }
//    
//    func modifyUserNickname(name: String) async throws -> String {
//        let result = try await network.request(
//            UsersAPI.modifyName(
//                requestDTO: UserNameRequestDTO(
//                    name: name
//                )
//            ),
//            decodingType: UserNameResponseDTO.self
//        )
//        let _ = userDefaultsService.save(result.name, key: .userName)
//        return result.name
//    }
//    
//    func getLastJourneyType() -> JourneyType {
//        let journey: String? = userDefaultsService.load(key: .journey)
//        return JourneyType.responseKeyToEnum(journey ?? "") ?? .recording
//    }
//    
//    func updateNotificationPermission() async throws -> Bool {
//        let result = try await network.request(
//            UsersAPI.updateNotificationPermission,
//            decodingType: AlarmEnabledResponseDTO.self
//        )
//        let alarmEnabled = result.alarmEnabled
//        let _ = userDefaultsService.save(alarmEnabled, key: .alarmEnabled)
//        
//        return alarmEnabled
//    }
//    
//    func checkHasEnterMyPage() -> Bool {
//        guard let hasEnterMyPage: Bool = userDefaultsService.load(key: .hasEnterMyPage) else {
//            let _ = userDefaultsService.save(true, key: .hasEnterMyPage)
//            return false
//        }
//        if !hasEnterMyPage {
//            let _ = userDefaultsService.save(true, key: .hasEnterMyPage)
//        }
//        return hasEnterMyPage
//    }
//    
//    func fetchMyCommonQuestAnswers(cursor: Int?) async throws -> CommonQuestMyAnswersEntity {
//        let result = try await network.request(
//            UsersAPI.fetchCommonQuestAnswers(cursor: cursor),
//            decodingType: CommonQuestMyAnswersResponseDTO.self
//        )
//        return result.toEntity()
//    }
//    
//    var alarmEnabled: Bool {
//        get {
//            guard let alarmEnabled: Bool = userDefaultsService.load(key: .alarmEnabled) else {
//                return false
//            }
//            return alarmEnabled
//        }
//    }
}
